From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:37:47 +0100
Subject: [Buildroot] [PATCH] configs/imx6q-sabresd: Bump to 4.9.7 kernel
In-Reply-To: <1485963687-30283-1-git-send-email-fabio.estevam@nxp.com>
References: <1485963687-30283-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20170201213747.1a596dbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Feb 2017 13:41:27 -0200, Fabio Estevam wrote:
> Kernel 4.9.7 has an important fix: a2104c7cd3b24c432 ("drm/atomic:
> clear out fence when duplicating state"), which fixes a kernel
> warning that triggers sometimes when starting/stopping ksmcube
> application several times in a row.
> 
> So bump to this version.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/imx6q-sabresd_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
