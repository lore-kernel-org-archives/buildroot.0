From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:46:54 +0200
Subject: [Buildroot] [PATCH v2 2/6] arch/config: Make RISC-V MMU optional
In-Reply-To: <20200908113324.1022230-3-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-3-damien.lemoal@wdc.com>
Message-ID: <20201006234654.5a205a05@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Sep 2020 20:33:20 +0900
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Linux supports No-MMU RISC-V since kernel version 5.8. Make MMU optional
> to enable building for RISC-V boards that do not have one.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

I think this should come after PATCH 3 and PATCH 4, otherwise the build
of the toolchain probably fails if you disable MMU support on RISC-V,
doesn't it ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
