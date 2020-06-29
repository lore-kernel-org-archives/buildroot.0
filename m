From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:11:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/unrar: bump version to 5.9.3
In-Reply-To: <20200628085149.616348-1-bernd.kuhls@t-online.de>
References: <20200628085149.616348-1-bernd.kuhls@t-online.de>
Message-ID: <20200629201127.GP20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-28 10:51 +0200, Bernd Kuhls spake thusly:
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

So I had to make up for the missed mpd patch of yours, so here we are
with unrar.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/unrar/unrar.hash | 2 +-
>  package/unrar/unrar.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
> index 9bfc32d325..a15bcc704a 100644
> --- a/package/unrar/unrar.hash
> +++ b/package/unrar/unrar.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  73d3baf18cf0a197976af2794a848893c35e7d42cee0ff364c89d2e476ebdaa6  unrarsrc-5.9.2.tar.gz
> +sha256  28c176c29da86d7efe3cb9a227255d8340f761ba95969195982ec87c8eb2dd69  unrarsrc-5.9.3.tar.gz
>  sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
> diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
> index 5c6f4b58da..9903c55d09 100644
> --- a/package/unrar/unrar.mk
> +++ b/package/unrar/unrar.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -UNRAR_VERSION = 5.9.2
> +UNRAR_VERSION = 5.9.3
>  UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
> -UNRAR_SITE = http://www.rarlab.com/rar
> +UNRAR_SITE = https://www.rarlab.com/rar
>  UNRAR_LICENSE = unrar
>  UNRAR_LICENSE_FILES = license.txt
>  
> -- 
> 2.26.2
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
