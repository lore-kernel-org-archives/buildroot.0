From: Ernest Williams <realcontrols@gmail.com>
Date: Mon, 30 Mar 2015 07:51:07 -0700
Subject: [Buildroot] clapack libraries missing?: buildroot-2014.11
Message-ID: <CADDnATcLG1SbgVZ8TB08J_yHU5vF7vKTPdwUZnFvcgewoUFdEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using "buildroot-2014.11"
I am using glibc and my target is INTEL x86_64
Version of CLAPACK:
CLAPACK_VERSION = 3.2.1

I would like to use clapack but missing the following libraries after the
install:

***********************
(1) lapack_LINUX.a
(2) blas_LINUX.a
(3) libF77.a
(4) libI77.a
************************

For includes I am also missing:
*************************************
"f2c.h"
**************************************


The only library, I see in the staging area is the following shared library:
=============================
liblapack.so
=============================


Cheers,
Ernesto
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150330/003f090d/attachment.html>
