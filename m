From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 11:35:47 +0200
Subject: [Buildroot] [PATCH 1/2] configs: mx53loco: Bump kernel version
 to 4.6.2
In-Reply-To: <1465524865-13105-1-git-send-email-festevam@gmail.com>
References: <1465524865-13105-1-git-send-email-festevam@gmail.com>
Message-ID: <20160610113547.3e8a0cfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 23:14:24 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Kernel 4.6.2 contains commit 63d0430f991314 ("drm/imx: Match
> imx-ipuv3-crtc components using device node in platform data")
> that fixes IPUv3 probing, so bump to this kernel version.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/mx53loco_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
