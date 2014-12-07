From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 22:47:50 +0100
Subject: [Buildroot] [PATCH branch/next] libgpgme: bump verstion to 1.5.2
In-Reply-To: <1417191218-64014-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417191218-64014-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141207214750.GH10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-28 16:13 +0000, Vicente Olivert Riera spake thusly:
> - Bump version to 1.5.2
> - Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Manually downloaded, and manually verified the hash.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgpgme/libgpgme.hash |    2 ++
>  package/libgpgme/libgpgme.mk   |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>  create mode 100644 package/libgpgme/libgpgme.hash
> 
> diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
> new file mode 100644
> index 0000000..fda2e7d
> --- /dev/null
> +++ b/package/libgpgme/libgpgme.hash
> @@ -0,0 +1,2 @@
> +# From https://www.gnupg.org/download/integrity_check.html
> +sha1  cb550ea09314a362aa895f1ca92da6ba73fb512a  gpgme-1.5.2.tar.bz2
> diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
> index 17271ad..fd25532 100644
> --- a/package/libgpgme/libgpgme.mk
> +++ b/package/libgpgme/libgpgme.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPGME_VERSION = 1.5.1
> +LIBGPGME_VERSION = 1.5.2
>  LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
>  LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
>  LIBGPGME_LICENSE = LGPLv2.1+
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141207/45b16fc7/attachment.asc>
