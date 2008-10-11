From: dishui <dishui@gmail.com>
Date: Sat, 11 Oct 2008 10:04:42 +0800
Subject: [Buildroot] uclibc toolchain get failed outside of buildroot
Message-ID: <200810111004414067835@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,all
   I have built buildroot and got the toolchain, I copied staging_dir to /usr/local/arm, and compiled application successfully. But if I rename buildroot, the compilation got failed, it showed "arm-linux-gcc: No such file or directory". In fact, I have exported the search path, I can TAB complete the arm-linux-gcc command. That means the toolchain can not work out of buildroot. How to fix it?

I have tried to add sysroot and isysroot options, but got the same result.

Best Regards,

kaimi

2008-10-11 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081011/8144a783/attachment.htm 
