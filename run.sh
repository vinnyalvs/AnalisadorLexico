#!/bin/bash
jflex lang.flex
javac *.java
java LangReader exemplo.txt
