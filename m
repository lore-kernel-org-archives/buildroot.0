From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 20:59:08 +0100
Subject: [Buildroot] [PATCH] configs/armadeus_apf28: bump kernel version
 to latest 4.9 LTS
In-Reply-To: <1511430584-4670-1-git-send-email-julien.boibessot@free.fr>
References: <1511430584-4670-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20171123205908.1e9449e5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Nov 2017 10:49:44 +0100, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> As there is now a defconfig inside kernel sources for mxs platforms, use it.
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  board/armadeus/apf28/linux-4.4.config | 185 ----------------------------------
>  configs/armadeus_apf28_defconfig      |   9 +-
>  2 files changed, 4 insertions(+), 190 deletions(-)
>  delete mode 100644 board/armadeus/apf28/linux-4.4.config

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
