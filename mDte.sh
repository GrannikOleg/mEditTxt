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
 HEAD(){ for (( a=2; a<=39; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                 \xE2\x94\x82\033[0m";
  done
 TPUT 1 1
 $E "\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m"
 TPUT 2 4
 $E "\033[1;36m*** dte - небольшой и гибкий консольный, текстовый редактор ***\033[34m           |\033[0m";
 TPUT 10 4
 $E "\033[1;36mРежим поиска \033[34m| \033[32mSEARCH MODE\033[0m";
 TPUT 11 3
 $E "\033[90mРежим поиска позволяет ввести расширенное регулярное выражение для поиска в текущем буфере.\033[0m";
 TPUT 12 3
 $E "\033[90mПривязки клавиш для режима поиска в основном такие же, как и в командном режиме, плюс эти дополнительные ключи:\033[0m";
 TPUT 15 4
 $E "\033[1;36mСреда        \033[34m| \033[32mENVIRONMENT\033[0m";
 TPUT 19 4
 $E "\033[1;36mФайлы        \033[34m| \033[32mFILES\033[0m";
 TPUT 26 4
 $E "\033[1;36mОпции        \033[34m| \033[32mOPTIONS\033[0m";
 TPUT 38 4
 $E "\033[36mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 3 1
 $E "\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 40 1
 $E "\033[34m+~~~| Grannik | 2021.11.17 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
 M0(){ TPUT  4 3; $e "Обзор                                                                      \033[32m SYNOPSIS                 \033[0m";}
 M1(){ TPUT  5 3; $e "Смотрите также                                                             \033[32m SEE ALSO                 \033[0m";}
 M2(){ TPUT  6 3; $e "Авторы                                                                     \033[32m AUTHORS                  \033[0m";}
 M3(){ TPUT  7 3; $e "Установка                                                                  \033[32m Installation             \033[0m";}
 M4(){ TPUT  8 3; $e "Основное использование                                                     \033[32m BASIC USAGE              \033[0m";}
 M5(){ TPUT  9 3; $e "Командный режим                                                            \033[32m COMMAND MODE             \033[0m";}
#
 M6(){ TPUT 13 3; $e "Переключить параметр поиска с учетом регистра                              \033[32m M-c                      \033[0m";}
 M7(){ TPUT 14 3; $e "Обратное направление поиска                                                \033[32m M-r                      \033[0m";}
#
 M8(){ TPUT 16 3; $e "Каталог конфигурации пользователя                                          \033[32m DTE_HOME                 \033[0m";}
 M9(){ TPUT 17 3; $e "Заставить dte использовать базу данных terminfo                            \033[32m DTE_FORCE_TERMINFO       \033[0m";}
M10(){ TPUT 18 3; $e "Идентификатор, используемый для определения того, какую запись использовать\033[32m TERM                     \033[0m";}
#
M11(){ TPUT 20 3; $e "Ваш личный файл конфигурации                                               \033[32m \$DTE_HOME/rc             \033[0m";}
M12(){ TPUT 21 3; $e "Ваши личные файлы синтаксиса                                               \033[32m \$DTE_HOME/syntax/*       \033[0m";}
M13(){ TPUT 22 3; $e "Записывает открытые файлы, чтобы защитить вас от случайного редактирования \033[32m \$DTE_HOME/file-locks     \033[0m";}
M14(){ TPUT 23 3; $e "История редактируемых файлов и положения курсора                           \033[32m \$DTE_HOME/file-history   \033[0m";}
M15(){ TPUT 24 3; $e "История команд dterc, использованных в командном режиме                    \033[32m \$DTE_HOME/command-history\033[0m";}
M16(){ TPUT 25 3; $e "История поисковых шаблонов, использованных в режиме поиска                 \033[32m \$DTE_HOME/search-history \033[0m";}
#
M17(){ TPUT 27 3; $e "Запустите команду после чтения файла rc и открытия любых аргументов файла  \033[32m -c command                \033[0m";}
M18(){ TPUT 28 3; $e "Перейти к исходному местоположению ctag                                    \033[32m -t ctag                   \033[0m";}
M19(){ TPUT 29 3; $e "Прочтите конфигурацию из файла rc вместо ~/.dte/rc                         \033[32m -r rcfile                 \033[0m";}
M20(){ TPUT 30 3; $e "Загрузите файл как файл dte-syntax и выйдите                               \033[32m -s file                   \033[0m";}
M21(){ TPUT 31 3; $e "Выгрузите содержимое встроенного rc или файла синтаксиса с именем rcname   \033[32m -b rcname                 \033[0m";}
M22(){ TPUT 32 3; $e "Распечатайте список всех встроенных имен конфигураций                      \033[32m -B                        \033[0m";}
M23(){ TPUT 33 3; $e "Не загружайте файлы истории при запуске и не сохраняйте файлы истории      \033[32m -H                        \033[0m";}
M24(){ TPUT 34 3; $e "Не читайте rc-файл                                                         \033[32m -R                        \033[0m";}
M25(){ TPUT 35 3; $e "Начните в специальном режиме                                               \033[32m -K                        \033[0m";}
M26(){ TPUT 36 3; $e "Отобразите сводку справки и выйдите                                        \033[32m -h                        \033[0m";}
M27(){ TPUT 37 3; $e "Отобразите номер версии и выйдите                                          \033[32m -V                        \033[0m";}
#
M28(){ TPUT 39 3; $e "Выход                                                                      \033[32m EXIT                      \033[0m";}
LM=28
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
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo " dte [-hBHKRV] [-c command] [-t ctag] [-r rcfile] [-b rcname] [[+line] file]...";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo " dterc, dte-syntax";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Craig Barnes:  cr@igbarn.es
 Timo Hirvonen: tihirvon@gmail.com";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo " Установка в Ubuntu (LinuxMint):
 sudo apt install dte
#
 Установка в ArchLinux из AUR:
 git clone https://aur.archlinux.org/dte.git
 cd dte
 makepkg -sri";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo -e "
 Вот некоторые из привязок клавиш по умолчанию. M-x - это Alt + x, а S-left - это Shift + left.
\033[32m S-вверх, S-вниз, S-влево, S-вправо\033[0m Переместите курсор и выберите символы
\033[32m Ctrl-S-влево, Ctrl-S-вправо _ _ _ \033[0m Переместите курсор и выделите слова целиком
\033[32m Ctrl-S-вверх, Ctrl-S-вниз _ _ _ _ \033[0m Переместите курсор и выберите целые строки
\033[32m Ctrl + C _ _ _ _ _ _ _  _ _ _ _ _ \033[0m Копировать текущую строку или выделение
\033[32m Ctrl + X _ _ _ _ __ _ _ _ _ _ _ _ \033[0m Вырезать текущую строку или выделение
\033[32m Ctrl + V _ _  _ _ _ _ _ _ _ _ _ _ \033[0m Вставить
\033[32m Ctrl + Z_ _ _ _ _ _ _ _ _ _ _ _ _ \033[0m Отменить
\033[32m Ctrl + Y _ _ _ _ _ _ _ _ _ _ _ _ _\033[0m Повторить
\033[32m M-x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \033[0m Войти в командный режим
\033[32m Ctrl + F _ _ _ _ _ _ _ _ _ _ _ _ _\033[0m Войти в режим поиска
\033[32m F3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \033[0m Искать далее
\033[32m F4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \033[0m Искать предыдущий
\033[32m Ctrl + T _ _ _ _ _ _ _ _ _ _  _ _ \033[0m Открыть новую вкладку
\033[32m M-N _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \033[0m Активировать N-ю вкладку
\033[32m Ctrl + W _ _ _ _ _ _ _ __ _ _ _ _ \033[0m Закрыть вкладку
\033[32m Ctrl + S _ _ _ _ _  _ _ _ _ _ _ _ \033[0m Сохранить файл
\033[32m Ctrl + Q _ _ __ _ _ _ _ _ _ _ _ _ \033[0m Выйти
";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo -e "
  Командный режим позволяет запускать различные команды редактора, используя язык, аналогичный оболочке Unix. Команды next и prev переключаются на следующую/предыдущую
 файл. Команды открытия, сохранения и выхода не требуют пояснений. Полный список доступных команд см. В dterc
  Привязки клавиш по умолчанию для командного режима:
\033[32m вверх вниз \033[0m Просмотрите историю предыдущих команд.
\033[32m tab _ _ _ _\033[0m Автозаполнение текущей команды или аргумента
\033[32m ^ A _ _ _ _\033[0m Перейти к началу командной строки
\033[32m ^ B _ _ _ _\033[0m Двигаться влево
\033[32m ^ C _ _ _ _\033[0m Выйти из командного режима
\033[32m ^ D _ _ _ _\033[0m Удалить
\033[32m ^ E _ _ _ _\033[0m Перейти в конец командной строки
\033[32m ^ F _ _ _ _\033[0m Двигаться вправо
\033[32m ^ K _ _ _ _\033[0m Удалить до конца командной строки
\033[32m ^ U _ _ _ _\033[0m Удалить до начала командной строки
\033[32m ^ W _ _ _ _\033[0m Удалить слово
\033[32m Esc _ _ _ _\033[0m Выйти из командного режима
";ES;fi;;
#---------------------------------------------------------
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo " Переключить параметр поиска с учетом регистра.";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo " Обратное направление поиска.";ES;fi;;
#
 8) S=M8;SC;if [[ $cur == enter ]];then R;echo " Каталог конфигурации пользователя. По умолчанию \$ HOME /.dte если не установлен.";ES;fi;;
 9) S=M9;SC;if [[ $cur == enter ]];then R;echo " Заставить dte использовать базу данных terminfo даже для терминалов со встроенной поддержкой. Включено, если установлено.";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " Идентификатор, используемый для определения того, какую запись terminfo или встроенную поддержку терминала использовать.";ES;fi;;
#
11) S=M11;SC;if [[ $cur == enter ]];then R;echo "  Ваш личный файл конфигурации. См. Dterc для получения полного списка доступных команд и опций или запустите «dte -b rc», чтобы увидеть встроенную,
 по умолчанию config.";ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;echo "  Ваши личные файлы синтаксиса. Они переопределяют файлы синтаксиса, поставляемые с программой. См. Dte-syntax для получения дополнительной информации или выполните
 «dte -b» синтаксис /dte в качестве основного примера.";ES;fi;;
13) S=M13;SC;if [[ $cur == enter ]];then R;echo " Записывает открытые файлы, чтобы защитить вас от случайного редактирования файлов, открытых в другом процессе. Используется, только если включена опция lock-files.";ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo " История редактируемых файлов и положения курсора. Используется, только если включена опция истории файлов.";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo " История команд dterc, использованных в командном режиме.";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;echo " История поисковых шаблонов, использованных в режиме поиска.";ES;fi;;
#
17) S=M17;SC;if [[ $cur == enter ]];then R;echo " Запустите команду после чтения файла rc и открытия любых аргументов файла. См. Доступные команды в dterc.";ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;echo " Перейти к исходному местоположению ctag. Требуется файл тегов, созданный ctags";ES;fi;;
19) S=M19;SC;if [[ $cur == enter ]];then R;echo " Прочтите конфигурацию из файла rc вместо ~/.dte/rc";ES;fi;;
20) S=M20;SC;if [[ $cur == enter ]];then R;echo " Загрузите файл как файл dte-syntax и выйдите. Любые обнаруженные ошибки выводятся в stderr, и статус выхода устанавливается соответствующим образом.";ES;fi;;
21) S=M21;SC;if [[ $cur == enter ]];then R;echo " Выгрузите содержимое встроенного rc или файла синтаксиса с именем rcname и выйдите.";ES;fi;;
22) S=M22;SC;if [[ $cur == enter ]];then R;echo " Распечатайте список всех встроенных имен конфигураций, которые можно использовать с параметром -b, и выйдите.";ES;fi;;
23) S=M23;SC;if [[ $cur == enter ]];then R;echo "  Не загружайте файлы истории при запуске и не сохраняйте файлы истории при выходе (см. Раздел ФАЙЛЫ ниже).
 Функции истории будут работать в обычном режиме, но будут доступнa только память и не сохраняется в файловой системе.";ES;fi;;
24) S=M24;SC;if [[ $cur == enter ]];then R;echo " Не читайте rc-файл.";ES;fi;;
25) S=M25;SC;if [[ $cur == enter ]];then R;echo " Начните в специальном режиме, который непрерывно считывает введенные данные и печатает имя и числовой код каждой нажатой клавиши.";ES;fi;;
26) S=M26;SC;if [[ $cur == enter ]];then R;echo " Отобразите сводку справки и выйдите.";ES;fi;;
27) S=M27;SC;if [[ $cur == enter ]];then R;echo " Отобразите номер версии и выйдите.";ES;fi;;
#
28) S=M28;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
