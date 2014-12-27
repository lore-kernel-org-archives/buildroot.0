From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 16:56:48 +0100
Subject: [Buildroot] [PATCH 1/5] libxmlrpc: bump to 1.25.30
In-Reply-To: <1419688038-15640-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419688038-15640-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227155648.GE4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 14:47 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libxmlrpc/libxmlrpc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> index a8e8aa3..1b771e2 100644
> --- a/package/libxmlrpc/libxmlrpc.mk
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBXMLRPC_VERSION = 1.25.26
> +LIBXMLRPC_VERSION = 1.25.30
>  LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
>  LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)

Since we do get a lot of dowenload issues with sourceforge, could you
take this opportunity to add a .hash file for libxmlrpc?

Regards,
Yann E. MORIN.

>  LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
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
