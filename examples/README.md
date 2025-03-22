# Examples for Yin Yang puzzle

File `dom00.txt` just contains an empty grid of 2x2. This example will be used as a simple, 
small test to check that your first encoding is going in the right direction. It can be easily
checked that the possible solutions for this small case correspond exactly to the following
**12 configurations**
```
00  00  10  01
01  10  00  00

00  01  10  11
11  01  10  00

11  11  01  10
10  01  11  11
```
You should check that your ASP encoding obtains these 12 solutions for `dom00.txt`.

The rest of the files `domXX.txt` have a unique solution included in the corresponding file 
`solXX.txt`. Please note that checking that `dom06.txt` has a unique solution may take some
time, since this example is particularly hard.
