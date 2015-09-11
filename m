From: Doha Ehab <dohaehab@gmail.com>
Date: Fri, 11 Sep 2015 12:50:33 +0300
Subject: [Buildroot] using buildroot to statically build uclibc
Message-ID: <CAEjFr-Zk4HTs7NPYOtheUzGbHVtZmmAb5daRR_MrW4yS22daGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ,
 I am trying to statically build uclibc using buildroot to use it to cross
compile mpich . when I generate uclibc toolchain using make menuconfig the
executables in output/usr/host/bin are dynamically linked .
do I have to build uclibc from output/build/toolchain folder in order to
get the statically linked executables .
I'm new to this if I'm missing something kindly direct me .

Regards,
Doha
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150911/fa5e3a66/attachment.html>
