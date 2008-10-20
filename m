From: hartleys <hartleys@visionengravers.com>
Date: Mon, 20 Oct 2008 12:20:07 -0400
Subject: [Buildroot] bug in uclibc.mk in latest tree
In-Reply-To: <76d9e2a30810200915s327c04a8we682872f5ff60795@mail.gmail.com>
References: <76d9e2a30810200915s327c04a8we682872f5ff60795@mail.gmail.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909B561EC@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, October 20, 2008 9:15 AM, Hai Zaar wrote:
> After updating to r23746, make fails with the following:
> toolchain/uClibc/uclibc.mk:654: *** extraneous `endif'.  Stop.
>
> It appears that there is extraneous 'endif' at line 559.

I have a similar problem with r23746.

toolchain/uClibc/uclibc.mk:440: *** commands commence before first
target.  Stop.

I'm not even sure what is causing the build failure. I am using an
external binary toolchain so I don't think uclibc should even be built.

Hartley
