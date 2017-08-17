From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 19:44:25 +0200
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
In-Reply-To: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
References: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170817194425.62504831@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 22:30:25 +0200, Thomas Petazzoni wrote:

> I'm not sure whether we want this for master or next. I've built 71
> toolchains with GCC 7.2.0 for toolchains.free-electrons.com, the vast
> majority of them being then used to build and boot a Linux kernel +
> minimal userspace under Qemu.
> 
> Unfortunately, the tag gcc-7_2_0-release has still not appeared in
> git://gcc.gnu.org/git/gcc.git, so it's hard to see the amount of
> changes between gcc 7.1.0 and gcc 7.2.0.
> 
> According to the release e-mail at
> https://gcc.gnu.org/ml/gcc/2017-08/msg00129.html:
> 
> """
> GCC 7.2 is a bug-fix release from the GCC 7 branch
> containing important fixes for regressions and serious bugs in
> GCC 6.1 with more than 95 bugs fixed since the previous release.
> """
> 
> Perhaps the safest is to take this in next.

Rethinking this: gcc 7.x is not the default gcc version currently used
in Buildroot, so I think bumping the 7.x series to 7.2.0 is quite safe
for the 2017.08 release.

However, I don't really mind, so I'll let others give their opinion on
this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
