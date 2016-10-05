From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:13:27 +0200
Subject: [Buildroot] [PATCH v2] board: add support for liteBoard
In-Reply-To: <20161003074831.11889-1-m.niestroj@grinn-global.com>
References: <20161003074831.11889-1-m.niestroj@grinn-global.com>
Message-ID: <20161005231327.78ba68d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Oct 2016 09:48:31 +0200, Marcin Niestroj wrote:
> Board support package includes:
> 
>  * Buildroot defconfig
>  * Mainline Linux kernel v4.8 with board support patches
>  * Mainline U-Boot v2016.09 with board support patches
>  * genimage config to create sdcard image
>  * Board readme.txt
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v1 -> v2:
>  * Bumped Linux version to 4.8
>  * Updated Linux patches to newest upstreamable version
>  * Updated U-Boot patches to upstreamable ones

Applied to master, thanks. Thanks Fabio for the review!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
