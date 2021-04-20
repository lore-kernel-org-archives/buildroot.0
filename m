From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:32:08 +0200
Subject: [Buildroot] [PATCH 01/25] package/automake: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420213208.GL298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-04-20 15:11 -0500, Matt Weber spake thusly:
> cpe:2.3:a:gnu:automake:* is a valid CPE identifier for this package:
> 
>  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aautomake
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

In this series of 25, I've applied all patches, except the libqmi one,
which is missing your SoB line.

Otherwise, I did a few changes here and there;

  - for the two python3 packages, I've added short hashes for the
    correspnding commits for the python(2) variants

  - in a few patches, I've moved the definitions right fter the license

  - I've updated the libtool commit as per your feedback

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/automake/automake.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index 89dcaa1293..ad8f0f474d 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -9,6 +9,7 @@ AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
>  AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>  AUTOMAKE_LICENSE = GPL-2.0+
>  AUTOMAKE_LICENSE_FILES = COPYING
> +AUTOMAKE_CPE_ID_VENDOR = gnu
>  
>  HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
>  
> -- 
> 2.17.1
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
