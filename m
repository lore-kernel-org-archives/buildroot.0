From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:05:43 +0200
Subject: [Buildroot] [PATCH] hsdk/linux: Fix USB regression
In-Reply-To: <20200505204930.10522-1-Evgeniy.Didin@synopsys.com>
References: <20200505204930.10522-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200725230543.6a03eda1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 May 2020 23:49:30 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> With this patch we enable CONFIG_USB for HSDK, which is not explicitly
> selected by UDL since the commit
> 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB").
> Commit 4c13ca86dcf8 ("ARC: [plat-hsdk]: fix USB regression")
> is not yet backported to Linux kernel 5.6.x, so we enable this
> option in fragment file for HSDK.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Note! This patch is a replacement of next patch:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200430163713.11290-1-Evgeniy.Didin at synopsys.com/

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
