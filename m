From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 09:09:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.74.0
In-Reply-To: <20200909061618.2053427-1-fido_max@inbox.ru>
References: <20200909061618.2053427-1-fido_max@inbox.ru>
Message-ID: <20200909090930.49f89422@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

Thanks for your contribution.

On Wed,  9 Sep 2020 09:16:18 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> bimap broken with C++20 GCC 10 due to allocator changes
> https://github.com/boostorg/bimap/issues/23

I'm not sure what this sentence means. Does this means that this new
version of Boost doesn't build with gcc 10 ? Or that it fixes issues
with gcc 10 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
