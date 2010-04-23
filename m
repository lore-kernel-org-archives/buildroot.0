From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Fri, 23 Apr 2010 23:12:13 +1000
Subject: [Buildroot] ct-NG proceed - 2009.11 can't write to /x-tools folder
	(R/O)
Message-ID: <1272028333.19524.9.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant/all,

I'm back on Ubuntu now, looked at crosstool-NG again, was quite simple
to install - must have had my wires crossed somewhere...
It built just fine in one take.

One simple question though :
I thought it prudent to leave the toolchain marked as "read only" in
ct-NG menuconfig.
However, when Buildroot-2009.11 has finished building gdb-6.8 (host,
target, server) it seems to want to make a copy of the executables to
the x-tools/arm-unknown-linux-uclibcgnueabi/bin folder (understandably
for path issues, I guess).
So BR2 make marks with dislike...

Is there a workaround, or do I temporarily allow writes to the x-tools
folder(s) ???

-- 
Best regards,
Kris
