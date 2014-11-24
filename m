From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Mon, 24 Nov 2014 13:10:51 +0100
Subject: [Buildroot] [PATCH v3] exiv2: new package
In-Reply-To: <20141122181444.148d48f0@free-electrons.com>
References: <1415357294-22601-1-git-send-email-nicolas.serafini@sensefly.com>
 <20141122181444.148d48f0@free-electrons.com>
Message-ID: <20141124131051.64275b80@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sat, 22 Nov 2014 18:14:44 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Nicolas Serafini,
> 
> On Fri, 7 Nov 2014 11:48:14 +0100, Nicolas Serafini wrote:
> > Add support for Exiv2 library and utility to manage image metadata
> > 
> > Exiv2 can be built in GPLv2+ or commercial version. But in
> > commercial version the Nikon lens name database and the NLS support
> > has to be disabled for copyright reason.
> > 
> > Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> 
> Thanks, I've applied your patch to the next branch. However, I've done
> a number of changes before applying your patch:
> 
>     [Thomas:
>      - switch to using the CMake build system, which works better
> than the clunky autoconf + manual Makefile based build system.

I started using cmake for this package, but the functionality is marked
as "work in progress" and is expected to be 100% functional for release
0.25. Still I just tested with several configurations and it works.

>      - add missing toolchains dependencies: does not build in static
>        library configuration, needs C++, etc.]

Thank you for adding toolchains dependencies. I would be careful to
add them next time.

> 
> If you could test the next branch, and verify that it continues to
> work in your situation, it would be great.

I tested it and it works as before.

Thanks for this commit

Regards,
Nicolas

> 
> Thanks a lot,
> 
> Thomas



-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
