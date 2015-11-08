From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 14:58:18 +0100
Subject: [Buildroot] [PATCH] system: Fix warning when selecting systemd
In-Reply-To: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151108145818.659e0829@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Fri,  6 Nov 2015 19:23:45 +0100, Maxime Hadjinlian wrote:
> With systemd and a custom skeleton, you end up with the following
> warning:
> warning: (BR2_INIT_SYSTEMD) selects BR2_ROOTFS_MERGED_USR which has
> unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  system/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
