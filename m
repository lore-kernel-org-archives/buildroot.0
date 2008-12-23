From: =?ISO-8859-1?Q?Bernhard_G=F6del?= <bernhard.goedel@gmx.at>
Date: Tue, 23 Dec 2008 11:29:28 +0100
Subject: [Buildroot] avr32: no selection for Binutils version
Message-ID: <4950BD88.2060503@gmx.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm new to embedded Linux, so I want to apologize for stupid questions 
in advance. :-)

I've bought the Atmel NGW100 featuring an AVR32 AP7000. Now I'm 
following the instructions given in the book 'Building embedded Linux 
Systems' (O'Reilly) to build a Linux system for this platform from scratch.

Therefore I've downloaded the package 
http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2 
(which points to 
http://buildroot.uclibc.org/downloads/snapshots/buildroot-20081221.tar.bz2 
currently) in order to build the tool chain.

I used 'make menuconfig' to enter the configuration for my target but 
I've encountered a problem here. After selecting 'AVR32' as target 
architecture, I cannot select any Binutils Version from the 'Toolchain' 
submenu.

I've downloaded an older version 
(http://buildroot.uclibc.org/downloads/snapshots/buildroot-20081120.tar.bz2), 
which offers Binutils 2.17 for AVR32.

Is this a bug in the newest buildroot package?
I didn't find the location where the available versions are stored, so I 
couldn't patch it myself...

Yours,
Bernhard
