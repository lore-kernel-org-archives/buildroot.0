From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 21:21:11 +0200
Subject: [Buildroot] [PATCH] package/kexec: bump to version 2.0.22
In-Reply-To: <20210503082252.2934537-1-fede@evolware.org>
References: <20210503082252.2934537-1-fede@evolware.org>
Message-ID: <20210504192111.GL2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Federico, All,

On 2021-05-03 10:22 +0200, Federico Pellegrin spake thusly:
> https://www.spinics.net/lists/kexec/msg26864.html
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kexec/kexec.hash | 2 +-
>  package/kexec/kexec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
> index e8eb932a65..c0a62f3e82 100644
> --- a/package/kexec/kexec.hash
> +++ b/package/kexec/kexec.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
> -sha256 e113142dee891638ad96e0f72cf9277b244477619470b30c41999d312e8e8702 kexec-tools-2.0.21.tar.xz
> +sha256 96c97f49ed86049f8b72722cb53e7fe3693e5a4f31e78a3a6249e3d18dac49c2 kexec-tools-2.0.22.tar.xz
>  # locally calculated
>  sha256 fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7 COPYING
> diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> index 280fe42d30..13b852c8ed 100644
> --- a/package/kexec/kexec.mk
> +++ b/package/kexec/kexec.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KEXEC_VERSION = 2.0.21
> +KEXEC_VERSION = 2.0.22
>  KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
>  KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
>  KEXEC_LICENSE = GPL-2.0
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
