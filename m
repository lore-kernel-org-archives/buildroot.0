From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 14:50:21 +0200
Subject: [Buildroot] [PATCH] uboot: mark Freescale i.MX28 specific
 formats as such
In-Reply-To: <1436616656-2566-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436616656-2566-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150719145021.7304077d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jul 2015 14:10:56 +0200, Thomas Petazzoni wrote:
> It's rather unclear that uboot.sb, uboot.sd and uboot.nand are
> Freescale i.MX28 specific, so let's make that clear in the prompt of
> each option, like we do for the Marvell-specific uboot.kwb.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/uboot/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
