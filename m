From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Nov 2014 16:32:12 +0100
Subject: [Buildroot] [PATCH] live555: bump to version 2014.11.01
In-Reply-To: <96de532c422855e13d0653be6d7e4307e21a99c8.1414942082.git.baruch@tkos.co.il>
References: <96de532c422855e13d0653be6d7e4307e21a99c8.1414942082.git.baruch@tkos.co.il>
Message-ID: <20141102153212.GA11634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-11-02 17:28 +0200, Baruch Siach spake thusly:
> Also add a hash file. Upstream provides md5 only, so add a locally generated
> sha256.

Manually downloaded tarball, and manually checked the hashes.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
> 	Add sha256 hash (Yann)
> ---
>  package/live555/live555.hash | 4 ++++
>  package/live555/live555.mk   | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>  create mode 100644 package/live555/live555.hash
> 
> diff --git a/package/live555/live555.hash b/package/live555/live555.hash
> new file mode 100644
> index 000000000000..d05b18b15878
> --- /dev/null
> +++ b/package/live555/live555.hash
> @@ -0,0 +1,4 @@
> +# From http://live555.com/liveMedia/public/live555-latest-md5.txt
> +md5	61ec3927fdff01fdaa831238a857b660	live.2014.11.01.tar.gz
> +# Locally generated
> +sha256	0896b3b787771496436fd0fad4a6a6905c46d4df50088a412216bf360975ca99	live.2014.11.01.tar.gz
> diff --git a/package/live555/live555.mk b/package/live555/live555.mk
> index 72b1264a2684..e933faaeae01 100644
> --- a/package/live555/live555.mk
> +++ b/package/live555/live555.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIVE555_VERSION = 2014.05.27
> +LIVE555_VERSION = 2014.11.01
>  LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
>  LIVE555_SITE = http://www.live555.com/liveMedia/public
>  LIVE555_LICENSE = LGPLv2.1+
> -- 
> 2.1.1
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141102/23280c0d/attachment.asc>
