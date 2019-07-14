From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:14:48 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: add rng-tools
 package
In-Reply-To: <1562775673-22148-2-git-send-email-pjtexier@koncepto.io>
References: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
 <1562775673-22148-2-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190714151448.6876e855@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Jul 2019 18:21:13 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> More entropy is required at boot time for the ssh
> daemon to start.
> 
> So, enable rngd which feeds the entropy to the kernel
> entropy tool.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
