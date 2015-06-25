From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2015 23:58:36 +0200
Subject: [Buildroot] [PATCH] libconfig: bump to 1.5
In-Reply-To: <1435261934-11054-1-git-send-email-yegorslists@googlemail.com>
References: <1435261934-11054-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150625215836.GF4178@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-06-25 21:52 +0200, Yegor Yefremov spake thusly:
> Add hash file.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Build-tested only; hash validated by Buildroot.

Regards,
Yann E. MORIN.

> ---
>  package/libconfig/libconfig.hash | 2 ++
>  package/libconfig/libconfig.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/libconfig/libconfig.hash
> 
> diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
> new file mode 100644
> index 0000000..30110cb
> --- /dev/null
> +++ b/package/libconfig/libconfig.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6  libconfig-1.5.tar.gz
> diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
> index a70ff94..f11937c 100644
> --- a/package/libconfig/libconfig.mk
> +++ b/package/libconfig/libconfig.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCONFIG_VERSION = 1.4.9
> +LIBCONFIG_VERSION = 1.5
>  LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
>  LIBCONFIG_LICENSE = LGPLv2.1+
>  LIBCONFIG_LICENSE_FILES = COPYING.LIB
> -- 
> 2.1.0
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150625/7d065692/attachment.asc>
