From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:29:01 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_pc_defconfig: bump kernel
 to 5.10.9, u-boot to 2020.10
In-Reply-To: <20210123154449.27156-1-peter@korsgaard.com>
References: <20210123154449.27156-1-peter@korsgaard.com>
Message-ID: <20210123212901.2a5dd42d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 Jan 2021 16:44:48 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> HDMI support is enabled by default in sunxi_defconfig since commit
> c822a3ec17 (ARM: configs: sunxi: Add DRM output-related options), so drop
> from fragment.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/orangepi/orangepi-pc/linux.fragment | 1 -
>  configs/orangepi_pc_defconfig             | 6 +++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
