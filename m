From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Mon, 4 Jun 2007 11:07:19 -0400
Subject: [Buildroot] Soft float toolchain on ARM
In-Reply-To: <46631CAE.4090305@lambsys.com>
Message-ID: <000601c7a6ba$0bd959b0$016efea9@SDW>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dave, 

Our systems are running

GCC 3.4.6
binutils 2.16.1
uClibc 0.9.29

My understanding is that soft floating-point is broken in the gcc 4 series.


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of David Lambert
Sent: Sunday, June 03, 2007 3:55 PM
To: buildroot at uclibc.org
Subject: [Buildroot] Soft float toolchain on ARM


I am running into problems when attempting to make a toolchain for the ARM
using soft-float. Does anyone have the magic combination of versions for
uClibc, gcc, etc. that provide a stable working toolchain?

TIA,

Dave.


_______________________________________________
buildroot mailing list
buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
