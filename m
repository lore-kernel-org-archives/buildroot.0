From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 15:56:00 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/boost: bump to version 1.74.0
In-Reply-To: <20200909093240.2178664-1-fido_max@inbox.ru>
References: <20200909093240.2178664-1-fido_max@inbox.ru>
Message-ID: <20200909155600.6cf8450e@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

On Wed,  9 Sep 2020 12:32:40 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> gcc 10 C++20 breaks boost library due to allocator changes.
> https://github.com/boostorg/bimap/issues/23
> 
> We need boost 1.74.0 to fix build with gcc 10
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

We don't have any failures of boost 1.73.0 with gcc 10 in our
autobuilders. Could you give more details about a specific
configuration that fails to build?

Indeed, we need to understand in which conditions this failure occurs,
to see if we need to backport the fix to 2020.08.x.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
