From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:04:19 +0100
Subject: [Buildroot] [PATCH] board/armadeus: bump apf51 kernel to 4.4.30
 (latest LTS)
In-Reply-To: <1478531682-6181-1-git-send-email-julien.boibessot@free.fr>
References: <1478531682-6181-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20161107220419.4c2ae9ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 16:14:42 +0100, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> This will fix:
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf51_defconfig.log.FAIL
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  .../apf51/{linux-3.12.config => linux-4.4.config}  | 26 ++++++++++++++++------
>  configs/armadeus_apf51_defconfig                   |  6 ++---
>  2 files changed, 22 insertions(+), 10 deletions(-)
>  rename board/armadeus/apf51/{linux-3.12.config => linux-4.4.config} (93%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
