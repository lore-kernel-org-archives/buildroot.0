From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Nov 2014 14:56:00 +0100
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2014.11.07
In-Reply-To: <1415626302-14068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415626302-14068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141110135600.GA3910@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-11-10 10:31 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Manually downloaded, and manually checked the hash.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 +-
>  package/wireless-regdb/wireless-regdb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> index d234e14..3f19793 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256	f362e3f6cf616c3120c3104a6d791b7b1145019bb117514844d78cf6655caa93	wireless-regdb-2014.10.07.tar.xz
> +sha256	4a6861266026c37d1a6b1bc76b863d731765169465999c2a0028103ba4173beb	wireless-regdb-2014.11.07.tar.xz
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index cb8aaf8..f37b5a6 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRELESS_REGDB_VERSION = 2014.10.07
> +WIRELESS_REGDB_VERSION = 2014.11.07
>  WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>  WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
> -- 
> 2.0.4
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141110/1ccf61f5/attachment.asc>
