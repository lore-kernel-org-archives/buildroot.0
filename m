From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:49:44 +0100
Subject: [Buildroot] [PATCH] board/lego/ev3: update to 4.14 kernel
In-Reply-To: <1511147950-13998-1-git-send-email-david@lechnology.com>
References: <1511147950-13998-1-git-send-email-david@lechnology.com>
Message-ID: <20171122214944.772556ad@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Nov 2017 21:19:10 -0600, David Lechner wrote:
> This updates the LEGO MINDSTORMS EV3 board to Linux kernel 4.14.
> 
> * Kernel patches are dropped because they are in mainline now.
> * This caused the kernel image to be >3M so some adjustments to the image
>   sizes/layout needed to be made in U-Boot.
> * Updated U-Boot version bumped since we are touching this config anyway
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
