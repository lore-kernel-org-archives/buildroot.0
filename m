From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2015 23:57:03 +0200
Subject: [Buildroot] [PATCH] openswan: bump to version 2.6.43
In-Reply-To: <1435258357-13784-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435258357-13784-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150625215703.GE4178@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-06-25 15:52 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Build-tested only; hash validated by Buildroot.

Regards,
Yann E. MORIN.

> ---
>  package/openswan/openswan.hash | 2 +-
>  package/openswan/openswan.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
> index 724a935..4853b3f 100644
> --- a/package/openswan/openswan.hash
> +++ b/package/openswan/openswan.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	1be58b684dedd4bf00946ac5c7c6e9fbf8ac5db849feea2360c42c5e87cb565a	openswan-2.6.42.tar.gz
> +sha256	ac7ef1d78766801f23c458cc7c3b080ca6e20c5144a1979598c319bc3bc7c88b	openswan-2.6.43.tar.gz
> diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
> index 335a72a..6c6a8a7 100644
> --- a/package/openswan/openswan.mk
> +++ b/package/openswan/openswan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSWAN_VERSION = 2.6.42
> +OPENSWAN_VERSION = 2.6.43
>  OPENSWAN_SITE = http://download.openswan.org/openswan
>  OPENSWAN_LICENSE = GPLv2+, BSD-3c
>  OPENSWAN_LICENSE_FILES = COPYING LICENSE
> -- 
> 2.3.6
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150625/6ebd8862/attachment.asc>
