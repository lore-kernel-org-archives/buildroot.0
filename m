From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 21:48:21 +0100
Subject: [Buildroot] [PATCH v2 4/4] board/lego/ev3: Use ev3dev linux ext
 for ev3dev drivers
In-Reply-To: <1478056556-30242-5-git-send-email-david@lechnology.com>
References: <1478056556-30242-1-git-send-email-david@lechnology.com>
 <1478056556-30242-5-git-send-email-david@lechnology.com>
Message-ID: <20161102214821.009a3ef7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 22:15:56 -0500, David Lechner wrote:
> This uses the ev3dev linux extension to compile the ev3dev drivers for
> LEGO MINDSTORMS EV3.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  .../0001-Create-empty-drivers-lego-Kconfig.patch   | 24 ----------------------
>  board/lego/ev3/readme.txt                          |  4 ++--
>  configs/lego_ev3_defconfig                         |  4 +---
>  3 files changed, 3 insertions(+), 29 deletions(-)
>  delete mode 100644 board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
