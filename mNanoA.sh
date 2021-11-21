#!/bin/bash
 E='echo -e';e='echo -en';trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
# 25 возможно это
 CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;90m";}
# 0 это цвет заднего фона списка
 UNMARK(){ $e "\e[0m";}
# ~~~~~~~~ Эти строки задают цвет фона ~~~~~~~~
 R(){ CLEAR ;stty sane;CLEAR;};
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 HEAD(){ for (( a=2; a<=41; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                  \xE2\x94\x82\033[0m";
  done
 TPUT 1 1
 $E "\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m"
 TPUT 2 4
 $E "\033[1;36m *** nano - Другой редактор Nano, вдохновленный Pico ***                  \033[0m \033[34m|\033[0m";
 TPUT 16 4
 $E "\033[1;36mОпции                                                                      \033[34m| \033[1;32mOPTIONS\033[0m";
 TPUT 39 4
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter                                                   \033[34m| \033[32m";
 MARK;TPUT 3 1
 $E "\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 42 1
 $E "\033[34m+~~~| Grannik | 2021.11.18 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then 
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
 M0(){ TPUT  4 3; $e "Установка                                                                   \033[32m Installation                      \033[0m";}
 M1(){ TPUT  5 3; $e "Обзор                                                                       \033[32m SYNOPSIS                          \033[0m";}
 M2(){ TPUT  6 3; $e "Уведомление                                                                 \033[32m NOTICE                            \033[0m";}
 M3(){ TPUT  7 3; $e "Описание                                                                    \033[32m DESCRIPTION                       \033[0m";}
 M4(){ TPUT  8 3; $e "Редактирование                                                              \033[32m EDITING                           \033[0m";}
 M5(){ TPUT  9 3; $e "Горячие клавиши                                                             \033[32m Hotkeys                           \033[0m";}
 M6(){ TPUT 10 3; $e "Переключатели                                                               \033[32m TOGGLES                           \033[0m";}
 M7(){ TPUT 11 3; $e "Файлы настроек                                                              \033[32m FILES                             \033[0m";}
 M8(){ TPUT 12 3; $e "Примечание                                                                  \033[32m NOTES                             \033[0m";}
 M9(){ TPUT 13 3; $e "Ошибки                                                                      \033[32m BUGS                              \033[0m";}
M10(){ TPUT 14 3; $e "Домашняя страница                                                           \033[32m HOMEPAGE                          \033[0m";}
M11(){ TPUT 15 3; $e "Смотрите также                                                              \033[32m SEE ALSO                          \033[0m";}
#
M12(){ TPUT 17 3; $e "Сделайте главный ключ умнее                                                 \033[32m -A           --smarthome          \033[0m";}
M13(){ TPUT 18 3; $e "При сохранении файла сделайте резервную копию                               \033[32m -B           --backup             \033[0m";}
M14(){ TPUT 19 3; $e "Создавайте не только один файл резервной копии                              \033[32m -C directory --backupdir=directory\033[0m";}
M15(){ TPUT 20 3; $e "Для интерфейса используйте жирный шрифт                                     \033[32m -D           --boldtext           \033[0m";}
M16(){ TPUT 21 3; $e "Преобразуйте набранные табуляции в пробелы                                  \033[32m -E           --tabstospaces       \033[0m";}
M17(){ TPUT 22 3; $e "По умолчанию считывает файл в новый буфер                                   \033[32m -F           --multibuffer        \033[0m";}
M18(){ TPUT 23 3; $e "При редактировании используйте блокировку в стиле vim                       \033[32m -G           --locking            \033[0m";}
M19(){ TPUT 24 3; $e "Сохраните последние сто строк поиска, замены и выполненных команд           \033[32m -H           --historylog         \033[0m";}
M20(){ TPUT 25 3; $e "Не смотрeть ни на nanorc системы, ни на nanorc пользователя                 \033[32m -I           --ignorercfiles      \033[0m";}
M21(){ TPUT 26 3; $e "Нарисуйте вертикальную полосу в данном столбце                              \033[32m -J number    --guidestripe=number \033[0m";}
M22(){ TPUT 27 3; $e "Непосредственно интерпретировать escape-последовательности                  \033[32m -K           --rawsequences       \033[0m";}
M23(){ TPUT 28 3; $e "Не добавляйте новую строку автоматически, если текст не заканчивается на ней\033[32m -L           --nonewlines         \033[0m";}
M24(){ TPUT 29 3; $e "Удалите завершающие пробелы из строки с переносом                           \033[32m -M           --trimblanks         \033[0m";}
M25(){ TPUT 30 3; $e "Отключить автоматическое преобразование файлов из формата DOS/Mac           \033[32m -N           --noconvert          \033[0m";}
M26(){ TPUT 31 3; $e "При выравнивании трактуйте строку, начинающуюся с пробела, как начало абзаца\033[32m -O           --bookstyle          \033[0m";}
M27(){ TPUT 32 3; $e "Для 200 самых последних файлов зарегистрируйте последнюю позицию курсора    \033[32m -P           --positionlog        \033[0m";}
M28(){ TPUT 33 3; $e "Установите регулярное выражение для соответствия цитируемой части строки    \033[32m -Q \"regex\"   --quotestr=\"regex\"   \033[0m";}
M29(){ TPUT 34 3; $e "Ограниченный режим                                                          \033[32m -R           --restricted         \033[0m";}
M30(){ TPUT 35 3; $e "Отображать на нескольких строках экрана строки, превышающие ширину экрана   \033[32m -S           --softwrap           \033[0m";}
M31(){ TPUT 36 3; $e "Задайте размер (ширину) вкладки для пронумерованных столбцов                \033[32m -T number    --tabsize=number     \033[0m";}
M32(){ TPUT 37 3; $e "Быстрое гашение строки состояния                                            \033[32m -U           --quickblank         \033[0m";}
M33(){ TPUT 38 3; $e "Показать номер текущей версии и выйти                                       \033[32m -V           --version            \033[0m";}
#
M34(){ TPUT 40 3; $e "Далее                                                                       \033[32m Onward                            \033[0m";}
M35(){ TPUT 41 3; $e "Выход                                                                       \033[32m EXIT                              \033[0m";}
LM=35
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC;if [[ $cur == enter ]];then R;echo " В Linux Ubuntu: nano установлена по умолчанию.
 В Archlinux:    pacstrap -i /mnt base linux linux-firmware sudo nano";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo " nano [options] [[+line[,column]] file]...
 nano [options] [[+[crCR](/|?)string] file]...";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Начиная с версии 4.0, по умолчанию nano:
 • не выполняет автоматическое обертывание слишком длинных линий,
 • включает строку под заголовком в области редактирования,
 • выполняет линейную (плавную) прокрутку.
 Если вы хотите вернуть прежнее поведение Pico, вы можете использовать: --breaklonglines, --emptyline и --jumpyscrolling (или для краткости -bej).";ES;fi;;
  3) S=M3;SC;if [[ $cur == enter ]];then R;echo " nano - небольшой и удобный редактор. Он копирует внешний вид Pico, но является бесплатным программным обеспечением и реализует несколько функций. Oткрытие нескольких
 файлов, прокрутка по строке, отмена/повтор, раскраска синтаксиса, нумерация строк и мягкое обертывание длинных строк.
   При указании имени файла в командной строке курсор можно поместить на определенную строку, добавив номер строки со знаком плюс и даже в конкретном столбце, добавив
 его через запятую. (Отрицательные числа отсчитываются от конца файла или строки.) Курсор последнее вхождение определенной строки, указав эту строку после +/ или +?
 перед именем файла. Строка может быть сделана можно интерпретировать как регулярное выражение, вставив c и/или r после знака +. Эти режимы поиска можно явно
 отключить вариант этих букв: C и/или R. Если строка содержит пробелы, ее необходимо заключить в кавычки. Приведу пример: появление слова "Foo", можно было бы сделать:
 nano +c/Foo file
 В качестве особого случая: если вместо имени файла указан тире (-), nano будет читать данные из стандартного ввода.";ES;fi;;
  4) S=M4;SC;if [[ $cur == enter ]];then R;echo "  Ввод текста и перемещение по файлу выполняется просто: набирая буквы и используя обычные клавиши перемещения курсора. Kлавиши Control (^) и Alt или Meta (M-).
 Две строки внизу экрана показывают некоторые важные команды. Bстроенная справка (^G) перечисляет все доступные можно изменить через файл nanorc - см. nanorc.";ES;fi;;
  5) S=M5;SC;if [[ $cur == enter ]];then R;echo -e "
\033[32m Ctrl + A\033[0m Для миграции маркера в начало очередной строки.
\033[32m Ctrl + B\033[0m Для миграции маркера на один символ назад.
\033[32m Ctrl + C\033[0m Для вывода информации о положении курсора в текстe.
\033[32m Ctrl + D\033[0m Для удаления символа спрва от маркера.
\033[32m Ctrl + E\033[0m Для миграции маркера в конец очередной строки.
\033[32m Ctrl + F\033[0m Переместить курсор на один символ вперед.
\033[32m Ctrl + G\033[0m Bызов каталога полной подсказки.
\033[32m Ctrl + H\033[0m Для устранения символа слева от маркера.
\033[32m Ctrl + I\033[0m Для вставки табуляции.
\033[32m Ctrl + J\033[0m Для автозаполнения очередного абзаца.
\033[32m Ctrl + K\033[0m Удалить строку в позиции курсора с сохранением ее в буфере.
\033[32m Ctrl + L\033[0m Для перерисовки очередного экрана.
\033[32m Ctrl + M\033[0m Аналог энтер.
\033[32m Ctrl + N\033[0m Переместить курсор на одну строку вниз.
\033[32m Ctrl + O\033[0m Сохранение редактируемого файла.
\033[32m Ctrl + P\033[0m Переместить курсор на одну строку вверх.
\033[32m Ctrl + 3\033[0m Вызвать режим, при котором Shift + 3 выдаст номера строк слева.
\033[32m Ctrl + R\033[0m Вставка текста из указанного файла в редактируемый файл.
\033[90ms\033[0m
\033[90mt\033[0m
\033[32m Ctrl + U\033[0m Вставить из буфера (того котрый после Ctrl + K остался)
\033[32m Ctrl + V\033[0m Перейти в конец текста.
\033[32m Ctrl + W\033[0m Для поиска слова в тексте. Далее в нижней строке ввести искомое слово.
\033[32m Ctrl + X\033[0m Покинуть программу.
\033[32m Ctrl + Y\033[0m Перейти в начало текста.
\033[90mz\033[0m
\033[32m Ctrl + /\033[0m Перейти на искомую строку. Далее в нижней строке ввести номер строки.
\033[32m Ctrl + \\ \033[0m Для замены текста в очередном файле сначала вводится замещаемый текст, потом, после нажатия Enter - замещающий.
";ES;fi;;
  6) S=M6;SC;if [[ $cur == enter ]];then R;echo "   Некоторые из вышеперечисленных опций можно включать и выключать также во время работы nano. Например, M-L переключает жесткую обертку > мягкий перенос,
 M-N переключает номера строк, M-M переключает мышь, M-I автоматический отступ, а M-X - строки справки. Смотрите в конце > полный список.
  Переключатель M-X особенный: он работает во всех меню, кроме средства просмотра справки и линтера. Все остальные переключатели работают только в главном меню.";ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;echo "   Когда указан --rcfile, nano будет читать только указанный файл для установки его параметров, синтаксиса и привязки клавиш. Без два файла конфигурации: сначала
 nanorc системы (если он существует), а затем nanorc пользователя (если он существует), или FIG_HOME/nano/nanorc или ~/.config/nano/nanorc, в зависимости от того,
 что встречается первым. См. Nanorc для получения дополнительной информации о возможном содержимом этих файлов.";ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;echo "   Если в командной строке или в одном из файлов nanorc не указана альтернативная команда проверки орфографии, nano проверит S один. В некоторых случаях nano
 попытается сбросить буфер в аварийный файл. Это произойдет в основном, если nano получит сигнал SIGHUP или S Он запишет буфер в файл с именем nano.save, если у
 буфера еще не было имени, или добавит суффикс .save к аварийный файл с таким именем уже существует в текущем каталоге, он добавит .save плюс число (например,.save.1)
 к t чтобы сделать его уникальным. В многобуферном режиме nano запишет все открытые буферы в соответствующие аварийные файлы.";ES;fi;;
  9) S=M9;SC;if [[ $cur == enter ]];then R;echo "   Запись и воспроизведение макросов клавиатуры работает правильно только в эмуляторе терминала, а не на консоли Linux (VT), потому что неисправность отличить
 измененные от немодифицированных клавиш со стрелками.
   Пожалуйста, сообщайте о любых других ошибках, с которыми вы сталкиваетесь, через: https://savannah.gnu.org/bugs/?group=nano.
   При сбое nano все измененные буферы сохраняются в аварийных файлах .save. Если вы можете воспроизвести аварию, и вы исправьте переменную окружения NANO_NOCATCH.";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo " https://nano-editor.org/";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo " nanorc
 /usr/share/doc/nano/ (или аналог в вашей системе)";ES;fi;;
#
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo " Сделайте главный ключ умнее. Когда Home нажимается где угодно, но не в самом начале непробельных символов на это начало (вперед или назад).
 Если курсор уже находится в этой позиции, он переместится в истинное начало строки.";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo " При сохранении файла сделайте резервную копию предыдущей версии, используя суффикс текущего имени файла с тильдой (~).";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo "   Создавайте и храните не только один файл резервной копии, но создавайте и сохраняйте файл с уникальным номером при каждом сохранении файла - когда файлы с
 уникальными номерами хранятся в указанном каталоге.";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo "   Для интерфейса используйте жирный шрифт вместо обратного видео. Это будет отменено установкой параметров titlecolor, stacolor, numbercolor и/или selectedcolor
 в вашем файле nanorc. См. Nanorc.";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo " Преобразуйте набранные табуляции в пробелы.";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo " По умолчанию считывает файл в новый буфер.";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo " При редактировании файлов используйте блокировку файлов в стиле vim.";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo " Сохраните последние сто строк поиска и строк замены и выполненных команд, поэтому их можно легко повторно использовать в последующих сеансах.";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo " Не смотрите ни на нанорк системы, ни на нанорк пользователя.";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo " Нарисуйте вертикальную полосу в данном столбце, чтобы оценить ширину текста. (Цвет полосы можно изменить ваш файл nanorc.)";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo "   Непосредственно интерпретировать escape-последовательности (вместо того, чтобы просить ncurses перевести их). Если вам нужна эта опция, чтобы получить пожалуйста,
 сообщите об ошибке. Использование этой опции отключает поддержку мыши nano.";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo " Не добавляйте новую строку автоматически, если текст не заканчивается на ней. (Это может привести к сохранению текстовых файлов, не относящихся к POSIX.)";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo " Удалите завершающие пробелы из строки с переносом, когда происходит автоматическая жесткая упаковка или когда текст выравнивается по ширине.";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo " Отключить автоматическое преобразование файлов из формата DOS / Mac.";ES;fi;;
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo "  При выравнивании трактуйте любую строку, начинающуюся с пробела, как начало абзаца.
 (если не включен автоматический отступ).";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;echo " Для 200 самых последних файлов зарегистрируйте последнюю позицию курсора и снова поместите ее в эту позицию при повторном открытии такого файла.";ES;fi;;
 28) S=M28;SC;if [[ $cur == enter ]];then R;echo "   Установите регулярное выражение для соответствия цитируемой части строки. Значение по умолчанию - «^ ([\ t] * ([! #% :;> |}] | //)) +». фактическая вкладка.)
 Это позволяет повторно выровнять блоки цитируемого текста при составлении электронного письма и перенастроить блоки исходный код.";ES;fi;;
 29) S=M29;SC;if [[ $cur == enter ]];then R;echo "   Ограниченный режим: не читайте и не записывайте файлы, не указанные в командной строке. Это означает: не читайте и не пишите привет в ожидании; не разрешать
 проверку орфографии; не разрешать добавление, добавление в начало или сохранение файла под другим na не делайте резервные копии файлов. Ограниченный режим также
 можно активировать, вызвав nano с любым именем, начинающимся с 'r' (например, 'rnano').";ES;fi;;
 30) S=M30;SC;if [[ $cur == enter ]];then R;echo "  Отображать на нескольких строках экрана строки, превышающие ширину экрана.
 (Вы можете сделать это мягкое обертывание при краe экрана, используя также --atblanks.) (Старая короткая опция - $ устарела.)";ES;fi;;
 31) S=M31;SC;if [[ $cur == enter ]];then R;echo " Задайте размер (ширину) вкладки для пронумерованных столбцов. Значение числа должно быть больше 0. Значение по умолчанию - 8.";ES;fi;;
 32) S=M32;SC;if [[ $cur == enter ]];then R;echo " Быстрое гашение строки состояния: сообщения строки состояния исчезнут после 1 нажатия клавиши вместо 25. Обратите внимание на эту опцию это.";ES;fi;;
 33) S=M33;SC;if [[ $cur == enter ]];then R;echo " Показать номер текущей версии и выйти.";ES;fi;;
#
 34) S=M34;SC;if [[ $cur == enter ]];then R;./mNanoB.sh;ES;fi;;
 35) S=M35;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
