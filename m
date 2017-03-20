From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:05:51 +0100
Subject: [Buildroot] [PATCH] configs/qemu: update xtensa linux to 4.9.16
In-Reply-To: <1489964904-28592-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489964904-28592-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170320220551.4f2a66e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 16:08:24 -0700, Max Filippov wrote:
> This fixes the following nommu kernel build issue:
> 
>   arch/xtensa/kernel/setup.c: In function 'cpu_reset':
>   arch/xtensa/kernel/setup.c:553:2: error: implicit declaration of function
>     'local_flush_tlb_all' [-Werror=implicit-function-declaration]
>     local_flush_tlb_all();
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  configs/qemu_xtensa_lx60_defconfig       | 2 +-
>  configs/qemu_xtensa_lx60_nommu_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
