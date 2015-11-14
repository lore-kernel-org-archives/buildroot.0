From: Michael Schweikart <micky@schweikarts-vom-dach.de>
Date: Sat, 14 Nov 2015 09:46:34 +0100
Subject: [Buildroot] headers_install.sh linux/ioport.h
Message-ID: <5646F4EA.6090703@schweikarts-vom-dach.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i have build a buildroot image with toolchain support and can build for 
example a application with use of the ncurses library inside eclipse.
Now I need to have the possibility to access the ISA Bus. Therefor i 
need the linux/ioport.h header file of the kernel, but the include File
is not copied into the directory 
"output/host/usr/i586-buildroot-linux-gnu". Why is this include file not 
copied. Is there a Kernel config option which i have to set correctly?

best regards
