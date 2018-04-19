From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 19 Apr 2018 10:14:24 +0200
Subject: [Buildroot] [PATCH] configs: add openssl for kernel where
 necessary
In-Reply-To: <20180418203634.30100-1-vincent.stehle@laposte.net>
References: <20180418203634.30100-1-vincent.stehle@laposte.net>
Message-ID: <789c3248-327e-2c69-208d-c88bc72363b2@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

Thanks for noticing grinn_chiliboard_defconfig! Please also add
grinn_liteboard_defconfig, as it has the same build issues with
missing openssl.

Regards,
Marcin

On 18.04.2018 22:36, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> Add host-openssl to those configs, which need it for the Linux kernel build.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>   configs/freescale_t1040d4rdb_defconfig | 1 +
>   configs/grinn_chiliboard_defconfig     | 1 + >   configs/mx25pdk_defconfig              | 1 +
>   configs/wandboard_defconfig            | 1 +
>   configs/warp7_defconfig                | 1 +
>   5 files changed, 5 insertions(+)
> <snip>


-- 
Marcin Niestroj
