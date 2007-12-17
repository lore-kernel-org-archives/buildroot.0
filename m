From: Marco <developement333@gmx.net>
Date: Mon, 17 Dec 2007 01:52:28 +0100
Subject: [Buildroot] bFLT build in precompiled ARM enviroment
Message-ID: <4765C84C.60605@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello list,

i've an running ARM enviroment, i downloaded the precompiled ARM
buildroot system. now i want to build a "hello worl" bFLT binary.
however, ive found that compiling bFLT should be something like:
gcc hw.c -elf2flt
it spits out an error about the entry point, however compiles to the end
and is executeable. if i do "file" on the binary it signs it as an "ELF"
file. so elf2flt was not working i guess.
can someone tell/link me how to build bflt binaries, is it possible with
the precompiled enviroment anyway?

thanx
