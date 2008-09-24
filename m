From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 24 Sep 2008 15:14:47 +0200
Subject: [Buildroot] Standalone toolchain
Message-ID: <48DA3D47.5060204@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is it possible to create a toolchain and then transfer it to another machine or just another folder, and have it work?

I've experienced the case where I only transferred staging_dir and put it somewhere and when I tried compiling some software compiler was lacking some header files. Creating absolute path link to newly created toolchain dir to point to staging_dir where it was taken from solved the problem..

Thank you,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
