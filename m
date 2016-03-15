From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Mar 2016 22:56:18 +0100
Subject: [Buildroot] [PATCH 1/2] xorriso: Bump version to 1.4.2
In-Reply-To: <1458050877-24342-2-git-send-email-benoit.allard@greenbone.net>
References: <1458050877-24342-1-git-send-email-benoit.allard@greenbone.net>
 <1458050877-24342-2-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160315215618.GF5053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, All,

On 2016-03-15 15:07 +0100, Beno?t Allard spake thusly:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[build-tested only, with no deps then with all deps]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

PS. Sorry for the potential duplicate, the previous mail hasn't made it
    to the list yet, one hour later...
YEM.

> ---
>  package/xorriso/xorriso.hash | 2 +-
>  package/xorriso/xorriso.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
> index 98a716d..3c2a726 100644
> --- a/package/xorriso/xorriso.hash
> +++ b/package/xorriso/xorriso.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e xorriso-1.3.8.tar.gz
> +sha256 2843beded1aa4c678706e96fdf9cc5e4b34430b559bdf5bc35df5202125004b3 xorriso-1.4.2.tar.gz
> diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
> index 5826340..e8bb5cb 100644
> --- a/package/xorriso/xorriso.mk
> +++ b/package/xorriso/xorriso.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XORRISO_VERSION = 1.3.8
> +XORRISO_VERSION = 1.4.2
>  XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
>  XORRISO_LICENSE = GPLv3+
>  XORRISO_LICENSE_FILES = COPYING COPYRIGHT
> -- 
> 2.1.4
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
