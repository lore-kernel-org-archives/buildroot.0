From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 11:38:37 +0200
Subject: [Buildroot] [PATCH v2] wandboard: Make explicit that a ext4
 rootfs is used
In-Reply-To: <1473633102-7920-1-git-send-email-festevam@gmail.com>
References: <1473633102-7920-1-git-send-email-festevam@gmail.com>
Message-ID: <20160912113837.33be0945@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 19:31:42 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Make explicit that a ext4 rootfs is used.
> 
> As explained by Thomas Petazzoni:
> 
> "the ext4 filesystem is already used.
> Indeed, the ext4 image is a symlink to the ext2 image, and the ext2
> image is in fact an ext4 image:
> 
> -rw-r--r-- 1 thomas thomas 3763200 sept. 11 21:54 rootfs.ext2
> lrwxrwxrwx 1 thomas thomas      11 sept. 11 21:54 rootfs.ext4 -> rootfs.ext2"
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Change sinces v1:
> - Fix Subject and commit log to explain that ext4 was already used
> and that this patch only make it more evident. (Thomas)

Applied to master, thanks. However maybe at some point you want to move
the wandboard to use the generic freescale genimage/post-image script
that I merged yesterday?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
