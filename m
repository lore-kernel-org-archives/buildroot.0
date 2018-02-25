From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:18:42 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: bump version
In-Reply-To: <1519475157-63049-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1519475157-63049-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <20180225221842.50b6879c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Feb 2018 13:25:57 +0100, Giulio Benetti wrote:
> For 4.16 support.
> 
> git shortlog --invert-grep --grep travis --no-merges e752ddc8c4b9f2b9b9c6d193e2ba354caf8707f5..
> Giulio Benetti (1):
>       mali: Fix build in 4.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
