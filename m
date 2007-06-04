From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Mon, 4 Jun 2007 11:43:51 -0400
Subject: [Buildroot] Soft float toolchain on ARM
In-Reply-To: <20070604173032.7c8dc0ef.philippe.ney@pardes.ws>
Message-ID: <000701c7a6bf$266b7790$016efea9@SDW>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dave, 

I forgot to add OABI and ARM920T, with no patches.

Does anyone know if there is a difference in 
the support for ARMv4 vs. ARMv5 instruction sets?

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Philippe Ney
Sent: Monday, June 04, 2007 11:31 AM
To: buildroot at uclibc.org
Subject: Re: [Buildroot] Soft float toolchain on ARM


Hi,

I used

gcc-4.0.3
binutils-2.17
uClibc-0.9.28

Philippe


> Dave,
> 
> Our systems are running
> 
> GCC 3.4.6
> binutils 2.16.1
> uClibc 0.9.29
> 
> My understanding is that soft floating-point is broken in the gcc 4 
> series.
> 
> 
> -----Original Message-----
> From: buildroot-bounces at uclibc.org 
> [mailto:buildroot-bounces at uclibc.org] On Behalf Of David Lambert
> Sent: Sunday, June 03, 2007 3:55 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] Soft float toolchain on ARM
> 
> 
> I am running into problems when attempting to make a toolchain for the 
> ARM using soft-float. Does anyone have the magic combination of 
> versions for uClibc, gcc, etc. that provide a stable working 
> toolchain?
> 
> TIA,
> 
> Dave.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
