From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 21:54:08 +0100
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime_mali:
 bump kernel version
In-Reply-To: <1480869026-6208-1-git-send-email-romain.naour@gmail.com>
References: <1480869026-6208-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204215408.3bbdcfbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 17:30:25 +0100, Romain Naour wrote:
> Bump the kernel to the next commit which fix the build with gcc6.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> Build tested only.
> For the same reason, the kernel used by
> olimex_a20_olinuxino_lime2_defconfig needs to bumped
> to 4.1.43 (at least). But since it's a big change, it
> require a runtime test on the board.
> ---
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
