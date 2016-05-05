From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 15:45:11 +0200
Subject: [Buildroot] [PATCH 1/2] configs/qemu: use zImage for sh4/sh4eb
 samples
In-Reply-To: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160505154511.6e53076d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 May 2016 08:30:56 -0300, Gustavo Zacarias wrote:
> The default for ARM was changed to uImage in 5c67cb1d, however the
> sh4/sh4eb sample configs were updated to drop zImage in error, hence
> end up building uImage which doesn't work with Qemu.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/qemu_sh4_r2d_defconfig   | 1 +
>  configs/qemu_sh4eb_r2d_defconfig | 1 +
>  2 files changed, 2 insertions(+)

Both patches applied. As discussed, for the first patch, I've reworked
the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
