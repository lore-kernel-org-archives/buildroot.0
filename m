From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:23:56 +0200
Subject: [Buildroot] [PATCH] board: remove Armadeus's APF9328 support
In-Reply-To: <1503321495-5763-1-git-send-email-julien.boibessot@free.fr>
References: <1503321495-5763-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20170821232356.1b243cf4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 15:18:15 +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> i.MX1/L boards require an old Linux kernel version to run, which is not
> compatible with latest Buildroot needs.
> Will fix:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873568
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  board/armadeus/readme.txt          |  9 ++-------
>  configs/armadeus_apf9328_defconfig | 29 -----------------------------
>  2 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 configs/armadeus_apf9328_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
