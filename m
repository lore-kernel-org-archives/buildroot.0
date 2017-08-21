From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:26:43 +0200
Subject: [Buildroot] [PATCH 1/2] configs/imx6q-sabresd_qt5: Remove
 BR2_TOOLCHAIN_BUILDROOT_GLIBC
In-Reply-To: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
References: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20170821232643.5f9c44f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 15:20:51 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> There is no need to select BR2_TOOLCHAIN_BUILDROOT_GLIBC, so just remove it.
> 
> Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6q-sabresd_qt5_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
