From: RR <rob.r374@gmail.com>
Date: Sat, 5 Dec 2020 16:24:44 +0100
Subject: [Buildroot] NoMMU system on CortexM7 - how to run from flash and
 supervise system with one or few simple apps ?
Message-ID: <06dc01d6cb1a$c2c5a7d0$4850f770$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I'm running Buildroot based UcLinux running on ARM Cortex M7 (noMMU,
STM32F769 DISCO board).

 

I'm curious how to establish efficient environment for running one or few
user space apps.

 

I'm thinking about external supervisor process that is already written or
maybe some custom solution... 

I'd like to supervise those processes, system resources (memory, cpu) and
restart them if needed or report to external network server. 

 

I'd also like to put as much as possible into Flash (have enough storage in
QSPI flash)

 

Any advice, your example, experience or pointers to more info would help me
a lot.

 

Thanks in advance, Rob.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201205/6c94f58d/attachment.html>
