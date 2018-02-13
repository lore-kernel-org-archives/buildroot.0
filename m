From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:21:23 +0100
Subject: [Buildroot] [PATCH next] configs/amarula_vyasa_rk3288: uboot
 needs pylibfdt
In-Reply-To: <20180210220427.17476-1-vincent.stehle@laposte.net>
References: <20180210220427.17476-1-vincent.stehle@laposte.net>
Message-ID: <20180213232123.7d48d72d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Feb 2018 23:04:27 +0100, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> For this platform, u-boot uses dtoc during the build, which needs Python
> libfdt. Set the corresponding option TARGET_UBOOT_NEEDS_PYLIBFDT in the
> defconfig.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
