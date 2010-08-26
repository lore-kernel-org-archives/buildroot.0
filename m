From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 26 Aug 2010 21:45:56 +1000
Subject: [Buildroot] compile qt application in buildroot
In-Reply-To: <AANLkTimBKaew98N3URzVddTPCXo+xCtyL4aZk3fEiP9c@mail.gmail.com>
References: <AANLkTimBKaew98N3URzVddTPCXo+xCtyL4aZk3fEiP9c@mail.gmail.com>
Message-ID: <002701cb4514$3fe7a800$bfb6f800$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Belisko Marek
> Sent: Thursday, 26 August 2010 9:18 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] compile qt application in buildroot
> 
> Hi,
> 
> I have successfully compile qt-embedded-4.6.2 in buildroot and I'm trying
to
> compile my custom qt application manually what is not easy.
> 
> I have an idea to integrate compilation to buildroot but not sure if this
will
> work (calling qmake ...).
> 
> It is possible to do it in that way or is there any example available how
to
> cross compile custom application using buildroot which use qt-embedded?

To do it manually change to your program directory and run
buildroot/output/staging/usr/bin/qmake
That will create a Makefile with all the cross-compile details, then just
run make.
You could also create a package to do this automatically.

Speaking of that, does anyone know a way to copy program source to package
build rather than putting it into a tarball/git?


Cheers,
Paul.
