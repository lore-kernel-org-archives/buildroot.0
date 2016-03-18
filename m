From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 21:49:46 +0100
Subject: [Buildroot] [PATCH 08/16] toolchain-buildroot: update glibc
 comment for noMMU
In-Reply-To: <56E9E9BD.2040107@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E9BD.2040107@mind.be>
Message-ID: <20160318214946.61d39157@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 00:18:21 +0100, Arnout Vandecappelle wrote:

> >   comment "(e)glibc only available with shared lib support"
> > +	depends on BR2_USE_MMU
> 
>   Actually, the rest of the architecture dependencies should also be repeated 
> then. It's a huge blob, so maybe introduce GLIBC_ARCH_DEPENDS? Which could, by 
> the way, also be used to protect comments for packages that depend on glibc.

I'll be happy to do that, however if you agree, I'd prefer to handle it
in a separate patch series. This one is already 18 patches long (in its
new version), and the problem you're pointing is not introduced by my
patch series.

Once this patch series is merged, I'll take care of introducing
foo_ARCH_DEPENDS options for the different C libraries.

Is it OK for you?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
