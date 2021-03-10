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
