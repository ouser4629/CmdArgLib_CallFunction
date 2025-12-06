## CmdArgLib_CallFunction

This package contains examples that use the `CallFunction` macro provided by the [Command Argument Library](https://github.com/ouser4629/cmd-arg-lib).

This macro is basically the same as the `MainFunction` macro except that the peer 
function is `call(names:tokens)` instead of`main()`. The `call` function allows you to 
(a) determine the command line tokens that get parsed and (b) get a return value and/or 
handle errors thrown during parsing or by the annotated work function.

---

### Call_1_PrintPhrase

<details>
<summary>Help Screen</summary>

```
> ./cf1-print --help
DESCRIPTION: Print a phrase multiple times followed by the number of words in
             the phrase.

USAGE: cf1-print [-iuh] [-r <count>] <phrase>

PARAMETERS:
  <phrase>              The phrase to be printed.
  -i                    Print a line counter before each phrase.
  -u                    Print output in upper case.
  -r/--repeats <count>  Times to print each phrase (default: 1).
  -h/--help             Print this help screen.
```  
  
</details>

<details>
<summary>Command Calls</summary>

```
> ./cf1-print -i "Big Boss Man - Jimmy Reed"
--> 1 Big Boss Man - Jimmy Reed
--> The phrase has 6 words
```

```
> ./cf1-print -r 3.0
Errors:
  missing a '<phrase>'
  '3.0' is not a valid <count>
See 'cf1-print --help' for more information.
```

</details>

---

### Call_2_PrintPhrase

This is the same as the previous example except that the help screens are slightly different. You
can change the format of the types from uppercased to underlined by commenting
and uncommenting the relevant lines of code.

Another difference is that the work function in the this example returns a value and is asynchronous.

<details>
<summary>Help Screen</summary>

```
> ./cf2-print --help
DESCRIPTION:
  Print a phrase multiple times followed by the number of words in the phrase.

USAGE: cf2-print [-iuh] [-r COUNT] PHRASE

PARAMETERS:
  PHRASE                          The phrase to be printed.
  -i                              Print a line counter before each phrase.
  -u                              Print output in upper case.
  -r/--repeats COUNT              Times to print each phrase (default: 1).
  -h/-help-me-if-you-can/--help   Print this help screen.
```

</details>

<details>
<summary>Command Calls</summary>

```
> ./cf2-print -i "Your Cheatin' Heart - Hank Williams"
--> 1 Your Cheatin' Heart - Hank Williams
--> The phrase has 6 words
```

```
> ./cf2-print -r 3.0
Errors:
  missing a 'PHRASE'
  '3.0' is not a valid COUNT
See 'cf2-print --help' for more information.
```

</details>

---

### Setup

<details>
<summary>Clone and Build</summary>

```
> mkdir Temp
> cd Temp
> git clone https://github.com/ouser4629/CmdArgLib_CallFunction.git
cd CmdArgLib_CallFunction
> swift build -c release
```

You might warning get a warning: 'input verification failed'.

</details>

<details>
<summary>Run</summary>

Press command T to set up a new tab in the terminal.

In the new tab:

```
> cd .build/release/
```

```
> ls -1F | grep '*'
cf1-print*
cf2-print*
CmdArgLibMacrosModule-tool*
```

```
> ./cf1-print --help
DESCRIPTION: Print a phrase multiple times followed by the number of words in
             the phrase.

USAGE: cf1-print [-iuh] [-r <count>] <phrase>

PARAMETERS:
  <phrase>              The phrase to be printed.
  -i                    Print a line counter before each phrase.
  -u                    Print output in upper case.
  -r/--repeats <count>  Times to print each phrase (default: 1).
  -h/--help             Print this help screen.
```

</details>

<details>
<summary>Tip</summary>

If you want to experiment it is recomended that you use the following cycle.

* Edit sources at ~/Temp/CmdArgLib_CallFunction/Sources
* Go to the "build" terminal tab at ~/Temp/CmdArgLib_CallFunction
* Rebuild: `> swift build -c release`
* Go to the "release" terminal tab at ~/Temp/CmdArgLib_CallFunction/.build/release
* Run the programs `> ./mf...`

Occasionally you might want to run `rm -rf .build .swiftpm` in the build tab. If
you do, be sure to close the current release tab, and set up a new one after the
build completes.

</details>
