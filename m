From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:29:23 +0100
Subject: [Buildroot] [PATCH] udoo/neo: Pass the rootfs offset
In-Reply-To: <1487161656-15772-1-git-send-email-fabio.estevam@nxp.com>
References: <1487161656-15772-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20170215212923.7a5f8d6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 10:27:36 -0200, Fabio Estevam wrote:
> When manually writing SPL and u-boot.img to the SD card the rootfs
> gets corrupted.
> 
> Fix this issue by passing a 1MB offset for the rootfs.
> 
> Reported-by: Breno Lima <breno.lima@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/udoo/neo/genimage.cfg | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
