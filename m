From: Anders Darander <anders.darander@gmail.com>
Date: Sat, 28 Jan 2012 21:04:01 +0100
Subject: [Buildroot] Gdb(server) on ARM and uClibc
Message-ID: <CAE4k23-gErY-gcTnjN1Ldeo6Qv=+ze4OFrMui-sw5HfP0R=9Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm probably missing something simple when it comes to my
uClibc-configuration... (Or is there still problems with gdb on uClibc
and ARM?)

I'm getting "error: No uintptr_t available; your C library is too
old." when I'm compiling uClibc. I've tried both 7.2.x and 7.3.x. Next
step will be to merge the tree I've based my work on sofar with
master, and try 7.4, however I doubt that it'll help me... (I've sofar
based this work on the tree
https://github.com/fhunleth/buildroot-beaglebone.git, as I'm working
on a beaglebone. I know that the tree in question is getting close to
2 months behind master now, but apart from the 7.4 inclusion, I
haven't seen anything in the git log that I immediately recognize as a
potential solution).

Any ideas were to start looking?
I've mostly been out of the buildroot world for a 1 1/2 year, working
on OE instead.

Cheers,
Anders

-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."
