From: Joachim Pihl <joachim.pihl@sensordevelopments.com>
Date: Tue, 07 Sep 2010 13:54:46 +0200
Subject: [Buildroot] AVR32 kernel install bug
Message-ID: <op.vinvdkgksev97k@joachim-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to build defconfig for ATNGW100 AVR32 card, and having this problem  
(after moving to uClibc 0.9.30 to avoid asm/unaligned.h problem):

>>>   Installing kernel
cp  
/home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/arch/avr32/boot/uImage  
/home/joachim/buildroot-2010.08/output/images
cp: cannot stat  
`/home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/arch/avr32/boot/uImage':  
No such file or directory
make: ***  
[/home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/.stamp_installed]  
Error 1


uImage can actually be found in  
/home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/arch/avr32/boot/images/,  
so there seems to be a difference of opinion between two or more scripts  
here. Building on Ubuntu 10.04LTS


-- 
Joachim Pihl
Development engineer
SENSOR DEVELOPMENTS AS
Tlf: +47 913 39 891
Nordre Kuller?d 21
NO-3241 Sandefjord
NORWAY
