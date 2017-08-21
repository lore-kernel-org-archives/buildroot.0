From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:31:07 +0200
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
In-Reply-To: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
References: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170821233107.13d61b41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 22:30:25 +0200, Thomas Petazzoni wrote:
> All patches continue to apply with no changes. 7.2.0 is a bugfix
> release of the 7.x branch.
> 
> The only change that is not a simple bump is that the 7.2.0 tarball is
> now available xz-compressed instead of bz2-compressed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> I'm not sure whether we want this for master or next. I've built 71
> toolchains with GCC 7.2.0 for toolchains.free-electrons.com, the vast
> majority of them being then used to build and boot a Linux kernel +
> minimal userspace under Qemu.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
