From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 17:43:48 +0200
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2015.04.06
In-Reply-To: <1428765089-9726-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428765089-9726-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150411154348.GJ4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 12:11 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Manually tested the hash.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 +-
>  package/wireless-regdb/wireless-regdb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> index d44391a..115b490 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256	5e6f00b8e23391de9b068b2400ac3172324e5f590fc424018bb5a1389ffe6f84	wireless-regdb-2015.03.13.tar.xz
> +sha256	4c4a10b3aa97ac494dda5bc13a045bda211437aab24341fe11d78530e640f133	wireless-regdb-2015.04.06.tar.xz
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index ce6f1d5..20b330f 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRELESS_REGDB_VERSION = 2015.03.13
> +WIRELESS_REGDB_VERSION = 2015.04.06
>  WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>  WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
> -- 
> 2.0.5
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150411/99b54cd8/attachment.asc>
