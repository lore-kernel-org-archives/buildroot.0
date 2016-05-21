From: Doha Ehab <dohaehab@gmail.com>
Date: Sat, 21 May 2016 03:26:22 +0200
Subject: [Buildroot] building opencv-2.4 using buildroot
Message-ID: <CAEjFr-YHkDmrwrx9cx2Bx7R=CVkivKzS8qDpUZpjH7SWWEHE1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
 I am trying to build opencv-2.4 for arm using buildroot-2015.08.01 from
build options ->libraries I have chosen static libraries only . when I try
to compile opencv code using the following command :
" buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-static ocv.c -o ocvccode "

I got this error
buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
cannot find -ldl
collect2: error: ld returned 1 exit status

how can I solve this linking issue?

Regards
Doha.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160521/030ffe49/attachment.html>
