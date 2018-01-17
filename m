From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:24:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpqxx: update dependencies
In-Reply-To: <20180117143148.6252-1-james.knight@rockwellcollins.com>
References: <20180117143148.6252-1-james.knight@rockwellcollins.com>
Message-ID: <20180117222405.00d7da82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 09:31:48 -0500, James Knight wrote:
> As of v6.x, libpqxx takes advantage of thread support for transaction
> sleeps (adding BR2_TOOLCHAIN_HAS_THREADS).
> 
> Re-order dependencies for:
>  - Key feature (postgresql)
>  - Architectures dependencies
>  - Remaining dependencies
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Fixes:
> http://autobuild.buildroot.net/results/e1d6f62edfc5eae90953f0a93fdb30d713409c37/

This should have been before the --- and Signed-off-by, because we want
to have this information as part of the commit log.

I've applied after adjusting this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
