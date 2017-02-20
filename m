From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 16:10:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170220145933.GQ12810@waldemar-brodkorb.de>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
 <20170220145933.GQ12810@waldemar-brodkorb.de>
Message-ID: <20170220161052.48208eac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 15:59:33 +0100, Waldemar Brodkorb wrote:

> I am not entirely sure, but can the reason for this be this patch we
> apply on top of gcc 5.4.x
> package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch?
> 
> I think all failures relate to some C++ header failures. Can anybody
> try with this patch applied?

Indeed could be the reason. Worth checking before we apply tons of
patches to individual packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
