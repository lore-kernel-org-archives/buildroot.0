From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Dec 2014 16:40:07 +0100
Subject: [Buildroot] [PATCH 03/14] nmap: bump to version 6.40
In-Reply-To: <1394483194-17592-3-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
 <1394483194-17592-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141213154007.GC4198@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

Rviving an old thread...

On 2014-03-10 17:26 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/nmap/nmap.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 47e4cfc..4ed39bf 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -NMAP_VERSION = 6.01
> +NMAP_VERSION = 6.40
>  NMAP_SITE = http://nmap.org/dist
>  NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>  NMAP_DEPENDENCIES = libpcap pcre
>  NMAP_CONF_OPT = --without-liblua --without-zenmap \
>  	--with-libdnet=included --with-liblinear=included \
> -	--with-libpcre="$(STAGING_DIR)/usr"
> +	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat

Why did you disable ncat?

Regards,
Yann E. MORIN.

>  NMAP_LICENSE = GPLv2
>  NMAP_LICENSE_FILES = COPYING
>  
> -- 
> 1.8.3.2
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
