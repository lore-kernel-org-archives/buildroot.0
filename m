From: Marco Espinoza <mespinoza1986@gmail.com>
Date: Sat, 19 May 2018 10:44:03 -0600
Subject: [Buildroot] Makefile.mk to compile using openmpi
Message-ID: <CAG__4ySBJQCD-gCtQeYYpYhsiyUm24OF2nZOqOqxPjeuZkpZTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm using buildroot to generate an image for a zedboard. And I'm trying to
add an application which require openmpi compilation.
However I'm having issues, because my compilation is failing.
The issue I'm having is because my program requires mpicc compilation, but,
despite I have installed openmpi in my buildroot image, the
cross-compilation is not working.

Would you please help me telling what do I need in my *.mk file, to
cross-compile properly using buildroot  a program which requires mpicc?

Thanks
Marco Espinoza
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180519/6d8ebfcd/attachment.html>
