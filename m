From: <bogus@does.not.exist.com>
Date: Thu, 17 Aug 2006 01:58:45 -0000
Subject: No subject
Message-ID: <mailman.8.1161944407.4264.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-4.x.x
Latest stable GNU config usable for armeb is: binutils-2.16.1 +
gcc-3.4.6
I am wondering if anybody worked on the build of armeb gnu toolchain
with gcc-4.x.x?

gcc-4.x.x provides new interesting cpu types: arm966, arm1176, ...etc

Many thanks for your answers.

Regards - Luc

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Tor Krill
Sent: vendredi 27 octobre 2006 08:07
To: Philippe Ney
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Error building arm toolchain: undefined
referenceto `raise'

Quoting Philippe Ney <philippe.ney@pardes.ws>:

> > Hi,
> >
> > I'm trying to build an up to date toolchain for our arm920t board,
> at91rm9200.
> > However compilation fails with a:
> [...]
> >
>
/home/tor/tmp/buildroot/toolchain_build_arm/gcc-4.1.1/gcc/config/arm/lib
1funcs.asm:1000:
> > undefined reference to `raise'
> [...]
> > Am i missing something here?
>
> Have a look at the gumstix buildroot (www.gumstix.org) for a patch=20
> called uClibc-gcc-41-raise-error.patch, I think this will do the
trick.

Thanks Philippe, this solved the compilation error.

/Tor
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
