From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:43:13 +0200
Subject: [Buildroot] [PATCH v3] configs/imx6-sabresd: Add VPU decoding
 support
In-Reply-To: <1507581821-22648-1-git-send-email-festevam@gmail.com>
References: <1507581821-22648-1-git-send-email-festevam@gmail.com>
Message-ID: <20171010224313.31b60751@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Oct 2017 17:43:41 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Mainline kernel is able to decode video via the coda driver.
> 
> Add support for it and also add some explanation on how VPU decoding
> can be tested with Gstreamer.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v2:
> - Remove incorrect comment on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV (Baruch)
> Changes since v1:
> - Add instructions in the readme file (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
