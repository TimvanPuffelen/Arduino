%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% arduino.cls
%
% code by E. A. Farina TeX Academy
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}%[2018/04/01]
\ProvidesClass{arduino}[2021/03/16 v0.3 LaTeX class for Boswell Arduino documents]%
\LoadClass[oneside]{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \RequirePackage{ifxetex}
    \RequirePackage{etoolbox}
    \RequirePackage{calc}
    \RequirePackage{changepage}
    \RequirePackage{environ}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout
    \RequirePackage{geometry}
    % Paper A4 210×297 mm   margin 2cm
    \newlength{\RM}\setlength{\RM}{60mm}
    \newlength{\RMsep}\setlength{\RMsep}{5mm}
    \newlength{\Margin}\setlength{\Margin}{20mm}
    \geometry{a4paper,
        top=\Margin,
        bottom=\Margin,
        left=\Margin,
        right={\Margin+\RM+\RMsep},
        marginparwidth=\RM,%
        marginparsep=\RMsep,%
    }
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{\baselineskip}
    \newlength{\widemargin}
    \setlength{\widemargin}{\paperwidth-\Margin-\Margin}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sectioning
    \setcounter{secnumdepth}{0}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
    \RequirePackage{anyfontsize}
    \RequirePackage{fontspec}
        \setmainfont{calibri}[Extension=.ttf,Path=./fonts/,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]
        \setsansfont{calibri}[Extension=.ttf,Path=./fonts/,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]
    \RequirePackage{polyglossia}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Syntax highlight from https://github.com/trihedral/ArduinoLatexListing
    \RequirePackage{xcolor}
    \RequirePackage{listings}
    %%% Define Custom IDE Colors %%%
    \definecolor{arduinoGreen}    {rgb} {0.17, 0.43, 0.01}
    \definecolor{arduinoGrey}     {rgb} {0.47, 0.47, 0.33}
    \definecolor{arduinoOrange}   {rgb} {0.8 , 0.4 , 0   }
    \definecolor{arduinoBlue}     {rgb} {0.01, 0.61, 0.98}
    \definecolor{arduinoDarkBlue} {rgb} {0.0 , 0.2 , 0.5 }
    %%% Define Arduino Language %%%
    \lstdefinelanguage{Arduino}{
        language=C++, % begin with default C++ settings
        %%% Keyword Color Group 1 %%%  (called KEYWORD3 by arduino)
        keywordstyle=\color{arduinoGreen},
        deletekeywords={% remove all arduino keywords that might be in c++
            break, case, override, final, continue, default, do, else, for, if, return, goto, switch, throw, try, while, setup, loop, export, not, or, and, xor, include, define, elif, else, error, if, ifdef, ifndef, pragma, warning, HIGH, LOW, INPUT, INPUT_PULLUP, OUTPUT, DEC, BIN, HEX, OCT, PI, HALF_PI, TWO_PI, LSBFIRST, MSBFIRST, CHANGE, FALLING, RISING, DEFAULT, EXTERNAL, INTERNAL, INTERNAL1V1, INTERNAL2V56, LED_BUILTIN, LED_BUILTIN_RX, LED_BUILTIN_TX, DIGITAL_MESSAGE, FIRMATA_STRING, ANALOG_MESSAGE, REPORT_DIGITAL, REPORT_ANALOG, SET_PIN_MODE, SYSTEM_RESET, SYSEX_START, auto, int8_t, int16_t, int32_t, int64_t, uint8_t, uint16_t, uint32_t, uint64_t, char16_t, char32_t, operator, enum, delete, bool, boolean, byte, char, const, false, float, double, null, NULL, int, long, new, private, protected, public, short, signed, static, volatile, String, void, true, unsigned, word, array, sizeof, dynamic_cast, typedef, const_cast, struct, static_cast, union, friend, extern, class, reinterpret_cast, register, explicit, inline, _Bool, complex, _Complex, _Imaginary, atomic_bool, atomic_char, atomic_schar, atomic_uchar, atomic_short, atomic_ushort, atomic_int, atomic_uint, atomic_long, atomic_ulong, atomic_llong, atomic_ullong, virtual, PROGMEM, Serial, Serial1, Serial2, Serial3, SerialUSB, Keyboard, Mouse, abs, acos, asin, atan, atan2, ceil, constrain, cos, degrees, exp, floor, log, map, max, min, radians, random, randomSeed, round, sin, sq, sqrt, tan, pow, bitRead, bitWrite, bitSet, bitClear, bit, highByte, lowByte, analogReference, analogRead, analogReadResolution, analogWrite, analogWriteResolution, attachInterrupt, detachInterrupt, digitalPinToInterrupt, delay, delayMicroseconds, digitalWrite, digitalRead, interrupts, millis, micros, noInterrupts, noTone, pinMode, pulseIn, pulseInLong, shiftIn, shiftOut, tone, yield, Stream, begin, end, peek, read, print, println, available, availableForWrite, flush, setTimeout, find, findUntil, parseInt, parseFloat, readBytes, readBytesUntil, readString, readStringUntil, trim, toUpperCase, toLowerCase, charAt, compareTo, concat, endsWith, startsWith, equals, equalsIgnoreCase, getBytes, indexOf, lastIndexOf, length, replace, setCharAt, substring, toCharArray, toInt, press, release, releaseAll, accept, click, move, isPressed, isAlphaNumeric, isAlpha, isAscii, isWhitespace, isControl, isDigit, isGraph, isLowerCase, isPrintable, isPunct, isSpace, isUpperCase, isHexadecimalDigit
        },
        % add arduino structures to group 1
        morekeywords={%
            break, case, override, final, continue, default, do, else, for, if, return, goto, switch, throw, try, while, setup, loop, export, not, or, and, xor, include, define, elif, else, error, if, ifdef, ifndef, pragma, warning
        },
        %%% Keyword Color Group 2 %%%  (called LITERAL1 by arduino)
        keywordstyle=[2]\color{arduinoBlue},
        % add variables and dataTypes as 2nd group
        keywords=[2]{
            HIGH, LOW, INPUT, INPUT_PULLUP, OUTPUT, DEC, BIN, HEX, OCT, PI, HALF_PI, TWO_PI, LSBFIRST, MSBFIRST, CHANGE, FALLING, RISING, DEFAULT, EXTERNAL, INTERNAL, INTERNAL1V1, INTERNAL2V56, LED_BUILTIN, LED_BUILTIN_RX, LED_BUILTIN_TX, DIGITAL_MESSAGE, FIRMATA_STRING, ANALOG_MESSAGE, REPORT_DIGITAL, REPORT_ANALOG, SET_PIN_MODE, SYSTEM_RESET, SYSEX_START, auto, int8_t, int16_t, int32_t, int64_t, uint8_t, uint16_t, uint32_t, uint64_t, char16_t, char32_t, operator, enum, delete, bool, boolean, byte, char, const, false, float, double, null, NULL, int, long, new, private, protected, public, short, signed, static, volatile, String, void, true, unsigned, word, array, sizeof, dynamic_cast, typedef, const_cast, struct, static_cast, union, friend, extern, class, reinterpret_cast, register, explicit, inline, _Bool, complex, _Complex, _Imaginary, atomic_bool, atomic_char, atomic_schar, atomic_uchar, atomic_short, atomic_ushort, atomic_int, atomic_uint, atomic_long, atomic_ulong, atomic_llong, atomic_ullong, virtual, PROGMEM
        },
        %
        %%% Keyword Color Group 3 %%%  (called KEYWORD1 by arduino)
        keywordstyle=[3]\bfseries\color{arduinoOrange},
        % add built-in functions as a 3rd group
        keywords=[3]{
            Serial, Serial1, Serial2, Serial3, SerialUSB, Keyboard, Mouse,
        },
        %
        %
        %%% Keyword Color Group 4 %%%  (called KEYWORD2 by arduino)
        keywordstyle=[4]\color{arduinoOrange},
        % add more built-in functions as a 4th group
        keywords=[4]{
            abs, acos, asin, atan, atan2, ceil, constrain, cos, degrees, exp, floor, log, map, max, min, radians, random, randomSeed, round, sin, sq, sqrt, tan, pow, bitRead, bitWrite, bitSet, bitClear, bit, highByte, lowByte, analogReference, analogRead, analogReadResolution, analogWrite, analogWriteResolution, attachInterrupt, detachInterrupt, digitalPinToInterrupt, delay, delayMicroseconds, digitalWrite, digitalRead, interrupts, millis, micros, noInterrupts, noTone, pinMode, pulseIn, pulseInLong, shiftIn, shiftOut, tone, yield, Stream, begin, end, peek, read, print, println, available, availableForWrite, flush, setTimeout, find, findUntil, parseInt, parseFloat, readBytes, readBytesUntil, readString, readStringUntil, trim, toUpperCase, toLowerCase, charAt, compareTo, concat, endsWith, startsWith, equals, equalsIgnoreCase, getBytes, indexOf, lastIndexOf, length, replace, setCharAt, substring, toCharArray, toInt, press, release, releaseAll, accept, click, move, isPressed, isAlphaNumeric, isAlpha, isAscii, isWhitespace, isControl, isDigit, isGraph, isLowerCase, isPrintable, isPunct, isSpace, isUpperCase, isHexadecimalDigit
        },
        %
        %
        %%% Set Other Colors %%%
        stringstyle=\color{arduinoDarkBlue},
        commentstyle=\color{arduinoGrey},
        %%%% Line Numbering %%%%
        %numbers=left,
        %numbersep=5pt,
        %numberstyle=\color{arduinoGrey},
        %stepnumber=2,
        %
        %
        %%%% Code Box Style %%%%
        breaklines=true,
        tabsize=2,
        basicstyle=\ttfamily
    }
    %% Define an Arduino style fore use later %%
    \lstdefinestyle{myArduino}{
        language=Arduino,
        %% Add other words needing highlighting below %%
        morekeywords=[1]{},                  % [1] -> dark green
        morekeywords=[2]{FILE_WRITE},        % [2] -> light blue
        morekeywords=[3]{SD, File},          % [3] -> bold orange
        morekeywords=[4]{open, exists},      % [4] -> orange
        %% The lines below add a nifty box around the code %%
        frame=single,
        rulesepcolor=\color{arduinoBlue},
    }
    \lstset{style=myArduino}
    \newbox\marginlst
    \newlength\marginlstoffset
    % framerule + framesep + rulesep:
    \setlength\marginlstoffset{\dimexpr2mm+3pt+2pt\relax}
    \lstnewenvironment{marginlisting}
      {%
        \lstset{style=myArduino ,
          % basicstyle = \small\ttfamily,
          % frame = leftline ,
          % framerule = 2mm ,
          % rulecolor = \color{black!20},
          breaklines = true ,
          linewidth = \dimexpr\marginparwidth-\marginlstoffset\relax
        }%
        \setbox\marginlst\hbox\bgroup
      }
      {%
        \egroup
        % or \marginnote:
        \marginpar{\hspace*{\marginlstoffset}\unhbox\marginlst}%
      }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Other packages
    \RequirePackage{amsmath}
    \RequirePackage{graphicx}
    \RequirePackage{booktabs}
    \RequirePackage{longtable}
    \RequirePackage{siunitx}
    \RequirePackage{enumitem}
    \RequirePackage{wrapfig}
    \RequirePackage{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Widebox
    \newenvironment{widebox}{\begin{adjustwidth}{0pt}{-\RM-\RMsep}\raggedright}{\end{adjustwidth}}
    \newlength{\miniboxsep}\setlength{\miniboxsep}{\RMsep}
    \newlength{\miniboxL}\newlength{\miniboxR}
    \NewEnviron{leftrightbox}[2][0.5]{%
        \setlength{\miniboxL}{#1\linewidth}%
        \setlength{\miniboxR}{\linewidth-\miniboxL-\miniboxsep}%
        \begin{minipage}{\miniboxL}\setlength{\parskip}{\baselineskip}\raggedright\BODY\end{minipage}%
        \hspace{\miniboxsep}%
        \begin{minipage}{\miniboxR}#2\end{minipage}
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alpha list
    \newenvironment{alphalist}{\begin{enumerate}[label={\alph*})]}{\end{enumerate}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Margin
    \RequirePackage{mparhack}
    \NewDocumentCommand{\marginfigure}{O{0pt} O{1} m}{\marginpar{\vspace{#1}\centering\includegraphics[width=#2\linewidth]{#3}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \AfterEndPreamble{\raggedright}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%