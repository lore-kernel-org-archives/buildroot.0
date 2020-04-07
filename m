From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 14:29:45 +0200
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version f4b9cde
In-Reply-To: <1586253605-27489-1-git-send-email-pjtexier@koncepto.io>
References: <1586253605-27489-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200407122945.GM22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pierre-Jean, All,

On 2020-04-07 12:00 +0200, Pierre-Jean Texier spake thusly:
> This includes the following changes:
> 
> f4b9cde Allow negative offsets
> 45bf92a Detect sector size if not found in config
> 9f59db6 uboot_env: remove unused variables
> 65d243e README: libubootenv is now in oe-core
> 
> And update hash file formatting (2 spaces).
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libubootenv/libubootenv.hash | 4 ++--
>  package/libubootenv/libubootenv.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
> index 383f550..d7d71fc 100644
> --- a/package/libubootenv/libubootenv.hash
> +++ b/package/libubootenv/libubootenv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 dc84eefd7dcde46e6754517be37dc0c5a6cd07d38db06564eb54acd9b9ff936e libubootenv-ba952d05ec9ab16029816a06d956bac7fb4e9832.tar.gz
> -sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
> +sha256  1afd4e70242a8196bf25622a4558d0baf9db5652d37d217156c08f6e37fd8e80  libubootenv-f4b9cde3815abe84a98079cedd515283ea08c16b.tar.gz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> index 44f8478..2a7c0e7 100644
> --- a/package/libubootenv/libubootenv.mk
> +++ b/package/libubootenv/libubootenv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUBOOTENV_VERSION = ba952d05ec9ab16029816a06d956bac7fb4e9832
> +LIBUBOOTENV_VERSION = f4b9cde3815abe84a98079cedd515283ea08c16b
>  LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
>  LIBUBOOTENV_LICENSE = LGPL-2.1
>  LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
> -- 
> 2.7.4
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
