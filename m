From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Mon, 30 Mar 2015 05:47:38 +0000
Subject: [Buildroot] clapack libraries missing?: buildroot-2014.11
Message-ID: <1ed4beae0f4f4af2b3afc6a204c648c3@exch13-mail05.win.slac.stanford.edu>
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

I would like to use clapack but missing the following libraries after the install:

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
