From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 21:56:49 +0100
Subject: [Buildroot] [PATCHv3 1/2] configs/raspberrypi: change
 deprecated pi3-miniuart-bt option to miniuart-bt
In-Reply-To: <20191204105430.943303-1-arthur.courtel@smile.fr>
References: <20191204105430.943303-1-arthur.courtel@smile.fr>
Message-ID: <20191208215649.66c3b654@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 11:54:29 +0100
Arthur Courtel <arthur.courtel@smile.fr> wrote:

> This option will be used in RPI4 config in order to have a working serial port on gpios.
> This change makes this option not only RPI3 specific.
> 
> Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
> ---
>  board/raspberrypi/post-image.sh      | 8 ++++----
>  board/raspberrypi/readme.txt         | 2 +-
>  configs/raspberrypi3_64_defconfig    | 2 +-
>  configs/raspberrypi3_defconfig       | 2 +-
>  configs/raspberrypi3_qt5we_defconfig | 2 +-
>  configs/raspberrypi4_defconfig       | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)

I've slightly improved the commit log, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
