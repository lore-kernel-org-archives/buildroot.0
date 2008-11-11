From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 11 Nov 2008 09:24:01 +0100
Subject: [Buildroot] Server administration,
	and does buildroot have a maintainer?
In-Reply-To: <200811091949.03358.rob@landley.net>
References: <200811091949.03358.rob@landley.net>
Message-ID: <e4c675870811110024o4cc0a920ja05d7bb3ea00084b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/10 Rob Landley <rob@landley.net>:

[cut]

>
> We're looking at gentoo embedded because then we'd be dogfooding uClibc and
> busybox, which is cool.  (No, buildroot is not an option; you have no package
> management, and the project has still never had an actual _release_.  The
> OSUOSL guys would really like something that's actually capable of being A)
> administered after installation, B) reliably reproduced.)  The OSUOSL guys
> have an auto-administration system that a couple variants of Gentoo are
> already registered in, and are willing to at least look at extending it to
> handle gentoo embedded.  (An alternative is that Solar and I can admin it,
> and since he's the gentoo embedded maintainer it doesn't get much better than
> that...)
>

http://groups.google.com/group/comp.os.linux.embedded/browse_thread/thread/e0eb218d42e19e67?hl=en&pli=1


Here is a (far incomplete) list of features for OE.
http://wiki.openembedded.net/index.php/Features

Functional

  * cross-compile packages for various CPU architectures like x86,
x86_64/amd64, powerpc, arm (various generations), mips, avr32
  * build complete bootable distributions that can be installed on flash or
SD/MMC media
  * build compatible package for non-OpenEmbedded based distributions like
Maemo, OpenWRT or various 'vendor Linuxes'
  * build thousands of software packages using all kinds of programming
languages and runtime environments like C/C++, Perl, Python, Java, Mono
  * create binary packages in IPK, RPM, DEB or tar.gz format
  * chose from a wide range of C libraries as the base of your distribution:
glibc, uclibc or eglibc
  * optionally employ Debian-like naming on binary packages (e.g. libfoo)
  * create complete toolchain packages for your target system which can be
deployed on application developer machines

Non-functional

  * reproduceable builds (let two persons with two different machines but
same setup create the same binary)
  * strongly self-hosting, requires only a minimum of tools to be installed
right away



 Cheers,
-- 
/roberto
