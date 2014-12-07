From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 22:46:12 +0100
Subject: [Buildroot] [PATCH branch/next] pinentry: bump version to 0.9.0
In-Reply-To: <1417190979-53042-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417190979-53042-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141207214611.GG10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-28 16:09 +0000, Vicente Olivert Riera spake thusly:
> - Bump version to 0.9.0
> - Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Manually downloaded and manually verified the hash

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pinentry/pinentry.hash |    2 ++
>  package/pinentry/pinentry.mk   |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>  create mode 100644 package/pinentry/pinentry.hash
> 
> diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
> new file mode 100644
> index 0000000..851c721
> --- /dev/null
> +++ b/package/pinentry/pinentry.hash
> @@ -0,0 +1,2 @@
> +# From https://www.gnupg.org/download/integrity_check.html
> +sha1  f8e5c774c35fbb91d84e82559baf76f6b4513236  pinentry-0.9.0.tar.bz2
> diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
> index 39358a7..56e8e71 100644
> --- a/package/pinentry/pinentry.mk
> +++ b/package/pinentry/pinentry.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PINENTRY_VERSION = 0.8.3
> +PINENTRY_VERSION = 0.9.0
>  PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
>  PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
>  PINENTRY_LICENSE = GPLv2+
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141207/c877dede/attachment.asc>
