From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:57:53 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add hash for license file
In-Reply-To: <1563219311-10528-1-git-send-email-pjtexier@koncepto.io>
References: <1563219311-10528-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190717085753.64573e32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 21:35:11 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fixes:
>  >>> uboot 2019.07 Collecting legal info  
>  ERROR: No hash found for Licenses/gpl-2.0.txt
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  boot/uboot/uboot.hash | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
