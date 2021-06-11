From: =?UTF-8?B?6Z+p56OK?= <hanlei_acoin@163.com>
Date: Fri, 11 Jun 2021 16:40:14 +0800 (GMT+08:00)
Subject: [Buildroot] error building busybox usring Buildroot
Message-ID: <77263d8f.6c2e.179fa3a9882.Coremail.hanlei_acoin@163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello?all?
    I'm currently using BuildRoot to build a nice integrated development environment.
    

    Basic information is as follows:

        ARCH: mips

        CROSS compiler ver : 5.4.0  , is external

        Buildroot ver : Latest stable release: 2021.05






    An error occurred when I went to the BusyBox Building:

        Toolschain/Ingenic/mips-gcc540-glibc222-64bit-r3.3.0/lib/gcc/mips-linux-gnu/5.4.0/include-fixed/uclibc/soft-float/limits.h:168:61: fatal error: limits.h: No such file or directory



    Oddly, this is correct when I compile BusyBox directly from the command line in the same directory  


    I wonder if the parameter Settings in buildroot are causing this error, but I can't confirm where.
    

Please see the attachment for the detailed log.

Thanks! 


| |
??
|
|
hanlei_acoin at 163.com
|
???????????
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210611/1ae3d7ed/attachment.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot_busybox_log.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210611/1ae3d7ed/attachment.txt>
