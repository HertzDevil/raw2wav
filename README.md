# raw2wav

Raw byte string to WAV file converter. This was put together in roughly 30
minutes because apparently there are no easy ways to compile [bytebeat][b]
entries (the classical variety, not the floating-point / JavaScript one)
losslessly.

### Synopsis

`raw2wav <filename> [<duration>] [<refresh>]`

### Description

Reads bytes from the standard input, and exports a WAV file called `<filename>`.
Every byte corresponds to an 8-bit unsigned audio sample. The output file is at
most `<duration>` seconds long (default 30) using `<refresh>` as the sample rate
(default 8000 Hz).

### Example

```
$ yes zzzzzzz | ./raw2wav.out pulse.wav 5
```

Produces a file which plays a 12.5% pulse wave at 1 kHz for 5 seconds.

```
$ cat example.c
#include <stdio.h>
int main(void){int t;for(;;++t)putchar((t*5&t>>7)|(t*3&t>>10));}
$ gcc example.c
$ ./a.out | ./raw2wav.out example.wav 20 22050
```

Produces the first example of [this video][1], but also makes it play much
faster.

### License

MIT License.

[1]: https://www.youtube.com/watch?v=tCRPUv8V22o
[b]: http://battleofthebits.org/lyceum/View/bytebeat+%28format%29
