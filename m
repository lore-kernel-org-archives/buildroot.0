From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 22:44:32 +0100
Subject: [Buildroot] [PATCH branch/next] libassuan: bump version to 2.1.3
In-Reply-To: <1417190663-35264-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417190663-35264-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141207214432.GF10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-28 16:04 +0000, Vicente Olivert Riera spake thusly:
> - Bump version to 2.1.3
> - Update the hash value
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Manually downloaded, and hash manually verified.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libassuan/libassuan.hash |    4 ++--
>  package/libassuan/libassuan.mk   |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
> index d875389..15a4a82 100644
> --- a/package/libassuan/libassuan.hash
> +++ b/package/libassuan/libassuan.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated after checking pgp signature
> -sha256	39f8a7c9349aaaf7ccd937b90660153ec4d2d4df2465018754e5bcae5b1db77b	libassuan-2.1.2.tar.bz2
> +# From https://www.gnupg.org/download/integrity_check.html
> +sha1  56ac91973c2818a91d4f16ed48265a2b5daf45d3  libassuan-2.1.3.tar.bz2
> diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
> index 1c2a4f2..b86f086 100644
> --- a/package/libassuan/libassuan.mk
> +++ b/package/libassuan/libassuan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBASSUAN_VERSION = 2.1.2
> +LIBASSUAN_VERSION = 2.1.3
>  LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
>  LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
>  LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
> -- 
> 1.7.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141207/1d74403d/attachment.asc>
