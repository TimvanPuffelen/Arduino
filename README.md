# Arduino manuals

1. Use the arduino.cls class:

```
\documentclass{arduino}
```

2. Set the document language:

```
\setmainlanguage{dutch}
```

3. Compile with `xelatex`


# Code

Use the `lstlisting` environment:

```
\begin{lstlisting}
void setup(){
  pinMode(13,OUTPUT);
}
\end{lstlisting}
```

For inline code, use `\lstinline`:

```
To write words \lstinline{void} from the code inline.
```

For code on the margin use the `marginlisting` environment.


# \begin{alphalist}

This is to make ordered list with a).


# Margin figure

```
\marginfigure[#1][#2]{#3}
```

- #1: optional, vertical space on top (0 as default)
- #2: optional, width of the image in terms of percentage of the margin width (1 is the default, 100%)
- #3: mandatory, the file name


# Data

You can change title, subtitle and author using

```
\DATA{title}{Arduino}
\DATA{subtitle}{Project based electronics \& programming teaching}
\DATA{author}{Ir. C.F.J. Pols}
```

in the preamble. The values in the example are default.
