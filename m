From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 22:59:05 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: Tweak TARGET_ABI for
 MPC8548
In-Reply-To: <CAHQ1cqFpf7ggXb=wWnmqHpoScMe-B8wmWO6az2f7RAx72C72OA@mail.gmail.com>
References: <20170712024737.21578-1-andrew.smirnov@gmail.com>
 <20170712093218.5a6a20ff@windsurf.lan>
 <CAHQ1cqFpf7ggXb=wWnmqHpoScMe-B8wmWO6az2f7RAx72C72OA@mail.gmail.com>
Message-ID: <20170714225905.6b8b19fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 14:47:15 -0500, Andrey Smirnov wrote:

> It's been a while, since I investigated this patch, but I believe we
> were seeing performance improvements on heavily numerical application
> on our system with "-mhard-float" while using custom built
> crosstools-ng e500 toolchain. But given how I didn't notice two
> significant problems with this patch and it is clearly not ready for
> prime time, let me go back and do more research/double check that I
> wasn't doing something dumb and missing the obvious.
> 
> I'll follow up with a separate patch if it's truly useful.

I think it definitely makes sense to continue work on this patch.
PowerPC is not the most well maintained architecture in Buildroot, so
it's very good to get contributions from our PowerPC users to improve
the support for this architecture.

If indeed PowerPC needs an explicit -mhard-float to use the FPU, we'll
have to fix Buildroot. Could you investigate this a little bit more?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
