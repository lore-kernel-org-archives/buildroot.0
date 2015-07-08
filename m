From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 09:31:10 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/libtirpc: does not build
 with musl libc
In-Reply-To: <1436331271.3691.4.camel@embedded.rocks>
References: <cover.1434292018.git.yann.morin.1998@free.fr>
 <a13a154a08aa3fd09400a2b1ae3571544a86f3db.1434292018.git.yann.morin.1998@free.fr>
 <20150614231725.6865e1a3@free-electrons.com>
 <1436331271.3691.4.camel@embedded.rocks>
Message-ID: <20150708093110.0e18e678@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 08 Jul 2015 06:54:31 +0200, J?rg Krause wrote:

> I submitted a patchset for libtirpc 0.2.4 too:
> http://patchwork.ozlabs.org/patch/468161/
> 
> I tested this patchset with eglibc and uClibc.

But libtirpc has been bumped to 0.3.1 in the mean time. I'll mark your
patch as Changes Requested. Can you respin it on top of 0.3.1 ? Less
patches should be needed, because several libtirpc/musl build issues
have been fixed upstream. Thanks!

> Note there is also another patch for libtirpc in the queue:
> http://patchwork.ozlabs.org/patch/468160/

I'll merge.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
