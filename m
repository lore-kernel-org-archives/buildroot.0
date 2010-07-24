From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sat, 24 Jul 2010 15:07:14 +0300
Subject: [Buildroot] [PATCH] add new arch for arm cortex-a9
In-Reply-To: <AANLkTikzk8tsG3_5yH0nb5l9YL8h2Ma_e2DhNmhlgpuZ@mail.gmail.com>
References: <AANLkTikzk8tsG3_5yH0nb5l9YL8h2Ma_e2DhNmhlgpuZ@mail.gmail.com>
Message-ID: <4C4AD772.4040605@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/2010 11:05 AM, falls huang wrote:
> --- Config.in.arch      2010-07-22 03:54:18.080361833 -0400
> +++ Config.in.arch.old  2010-07-22 03:54:33.632350886 -0400
> @@ -81,11 +81,9 @@
>          bool "arm1176jz-s"
>   config BR2_arm1176jzf_s
>          bool "arm1176jzf-s"
> -comment "cortex-A8/A9 needs gcc>= 4.4.x"
> +comment "cortex-A8 needs gcc>= 4.4.x"
>   config BR2_cortex_a8
>          bool "cortex-A8"
> -config BR2_cortex_a9
> -       bool "cortex-A9"
>   config BR2_sa110
>          bool "sa110"
>   config BR2_sa1100
> @@ -602,7 +600,6 @@
>          default arm1176jz-s     if BR2_arm1176jz_s
>          default arm1176jzf-s    if BR2_arm1176jzf_s
>          default cortex-a8       if BR2_cortex_a8
> -       default cortex-a9       if BR2_cortex_a9
>          default strongarm110    if BR2_sa110
>          default strongarm1100   if BR2_sa1100
>          default xscale          if BR2_xscale
> @@ -719,7 +716,6 @@
>          default armv6zk         if BR2_arm1176jz_s
>          default armv6zk         if BR2_arm1176jzf_s
>          default armv7-a         if BR2_cortex_a8
> -       default armv7-a         if BR2_cortex_a9
>          default armv4           if BR2_sa110
>          default armv4           if BR2_sa1100
>          default armv5te         if BR2_xscale

Your patch is backwards and you should add Signed-off-by line.
