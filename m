From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2019 12:17:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/gob2: add license
In-Reply-To: <20191124091051.1017317-1-fontaine.fabrice@gmail.com>
References: <20191124091051.1017317-1-fontaine.fabrice@gmail.com>
Message-ID: <20191124111705.GF32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-24 10:10 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've added the accompanying COPYING.generated-code to the list of
license files (and added a hash for it), and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gob2/gob2.hash | 1 +
>  package/gob2/gob2.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/gob2/gob2.hash b/package/gob2/gob2.hash
> index 3678bdd5c9..b7db5c6f0b 100644
> --- a/package/gob2/gob2.hash
> +++ b/package/gob2/gob2.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256 f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026  gob2-2.0.20.tar.xz
> +sha256 b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
> diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
> index fe60673821..325dc2433a 100644
> --- a/package/gob2/gob2.mk
> +++ b/package/gob2/gob2.mk
> @@ -7,6 +7,8 @@
>  GOB2_VERSION = 2.0.20
>  GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.xz
>  GOB2_SITE = http://ftp.5z.com/pub/gob
> +GOB2_LICENSE = GPL-2.0+
> +GOB2_LICENSE_FILES = COPYING
>  HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
>  
>  $(eval $(host-autotools-package))
> -- 
> 2.24.0
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
