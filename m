From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:20:40 +0200
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.8
In-Reply-To: <1396259058-15561-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396259058-15561-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140403202040.350279b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 31 Mar 2014 11:44:18 +0200, Eric Le Bihan wrote:
> Systemd needs Linux headers >= 3.8 because it uses IFLA_GRE_FLOWINFO,
> IFLA_IPTUN_FLAGS from linux/if_tunnel.h.
> 
> Fixes http://autobuild.buildroot.org/results/ad3/ad3b4003dc50582a493f1156234d83652104a6bf/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  system/Config.in |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
