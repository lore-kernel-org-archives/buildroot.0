From: Rick Foos <rick@synchromeshcomputing.com>
Date: Thu, 26 Jul 2007 02:20:50 -0500
Subject: [Buildroot] BASE_TARGETS aren't build
References: <20070725200039.GA26294@firebird.dresden.micronet24.de>
Message-ID: <001401c7cf55$7f2bb890$6404a8c0@shukson>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GDB in particular is now broken on a clean build, and stops the build. This 
recently happened.

I agree many others have been trying to build w/o a toolchain for some time.

Rick Foos

----- Original Message ----- 
From: "Benjamin Tietz" <benjamin@micronet24.de>
To: <buildroot@uclibc.org>
Sent: Wednesday, July 25, 2007 3:00 PM
Subject: [Buildroot] BASE_TARGETS aren't build


> Hi,
>
> some days ago the building of the toolchain and the crosscompiler was
> moved from TARGETS to BASE_TARGETS, and the second made dependent of the
> first. It looked nice, but at least for me, it doesn't work.
>
> Getting a virgin buildroot building all the packages (and the toolchain)
> doesn't take this dependency in account and starts to compile packages
> for the target. Without an working gcc this may be difficult...
>
> There were a rule, some time ago - never break the build - where is it
> gone. Some time ago the buildroot built, even for avr32, without to much
> problems. There going discussions on about distributional packages and 
> BSPs.
> But as long as the toolchain doesn't built, all these gimmicks aren't
> usable.
>
> By the way that problem isn't the only thing broken at the moment; I
> fixed it by now by reverting the patch and letting the toolchain compile
> as usual targets.
>
> regards
>
> Benjamin
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> 
