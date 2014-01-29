From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 29 Jan 2014 09:19:42 +0100
Subject: [Buildroot] full rebuild and errors
In-Reply-To: <52E8AA41.1020709@mind.be>
References: <52E4FA8C.7060109@gmail.com> <52E6945C.40202@mind.be>
 <52E8120F.7080805@gmail.com> <20140128230904.1f01a5dc@skate>
 <52E8AA41.1020709@mind.be>
Message-ID: <52E8B99E.1060201@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 29/01/2014 08:14, Arnout Vandecappelle ha scritto:
>  Marco, can you try to remember exactly what was different between the 
> first and second build? Was it the same buildroot source, the same 
> buildroot config, etc.?


Here what I did:

in the morning
1) cd ~
2) git clone git://github.com/albertd/buildroot-rpi
3) cd buildroot-rpi
4) make rpi_defconfig
5) make menuconfig (but I changed nothing)
6) make
7) burned the sd-card and play a while with the RPi

in the afternoon
after I discovered the error about eglfs which prevents any Qt 
application from running I tried to rebuild:
8) make clean all
9) make rpi_defconfig
10) make
*** here the error I described in the previous messages
11) rm -rf ~/buildroot-rpi
12) then I repeated the points 2-6 with the same errors during make

I'm sure I didn't upgraded any package of my Debian machine.

Maco
