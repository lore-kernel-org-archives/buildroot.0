From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 18:14:44 +0100
Subject: [Buildroot] [PATCH v3] exiv2: new package
In-Reply-To: <1415357294-22601-1-git-send-email-nicolas.serafini@sensefly.com>
References: <1415357294-22601-1-git-send-email-nicolas.serafini@sensefly.com>
Message-ID: <20141122181444.148d48f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

On Fri, 7 Nov 2014 11:48:14 +0100, Nicolas Serafini wrote:
> Add support for Exiv2 library and utility to manage image metadata
> 
> Exiv2 can be built in GPLv2+ or commercial version. But in commercial
> version the Nikon lens name database and the NLS support has to be
> disabled for copyright reason.
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

Thanks, I've applied your patch to the next branch. However, I've done
a number of changes before applying your patch:

    [Thomas:
     - switch to using the CMake build system, which works better than the
       clunky autoconf + manual Makefile based build system.
     - add missing toolchains dependencies: does not build in static
       library configuration, needs C++, etc.]

If you could test the next branch, and verify that it continues to work
in your situation, it would be great.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
