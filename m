From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:35:24 +0200
Subject: [Buildroot] [PATCH 1/1] Improve support of OpenGL for
 BeagleBone Black
In-Reply-To: <1401636127-20618-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1401636127-20618-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140608163524.6fc64df5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Sun,  1 Jun 2014 17:22:07 +0200, Hadrien Boutteville wrote:
> Make ti-gfx working on BeagleBone Black by adding an ugly necessary
> patch to the kernel wich fix:
> pvrsrvkm: Unknown symbol v7_dma_map_area
> pvrsrvkm: Unknown symbol v7_dma_flush_range
> 
> Add drivers to the default kernel config used in beaglebone_defconfig
> to enable the framebuffer.
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> ---
>  board/beaglebone/linux-3.12.config                 | 11 ++++++-
>  ...cache-flush-management-symbols-when-MULTI.patch | 34 ++++++++++++++++++++++
>  configs/beaglebone_defconfig                       |  1 +
>  3 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
