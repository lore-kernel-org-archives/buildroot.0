From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 13:43:57 +0200
Subject: [Buildroot] [PATCH] package/firmware-imx: fix legal-info
In-Reply-To: <1436700629-5494-1-git-send-email-yann.morin.1998@free.fr>
References: <1436700629-5494-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150712134357.63df0dcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 12 Jul 2015 13:30:29 +0200, Yann E. MORIN wrote:
> Part of fimrware-ims were dropped in the new version, so we have less
> leglal-info to save.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/59b/59b09152700a5839af46edb554e53981569f8921
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
