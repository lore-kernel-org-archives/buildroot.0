From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 17:44:11 +0100
Subject: [Buildroot] [PATCHv2 1/3] libxmlrpc: bump to 1.25.30 and add
 hash file
In-Reply-To: <1419697556-32541-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419697556-32541-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419697556-32541-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227164411.GI4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 17:25 +0100, Thomas Petazzoni spake thusly:
> This commit bumps libxmlrpc to the latest available stable version,
> and adds a hash file.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Hash manually verified to be OK.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libxmlrpc/libxmlrpc.hash | 2 ++
>  package/libxmlrpc/libxmlrpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/libxmlrpc/libxmlrpc.hash
> 
> diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
> new file mode 100644
> index 0000000..d37fcfc
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 8ae6ed4ec57d50ed132b1150fc5258346eef3e291501a564f14fa97586902f98 xmlrpc-c-1.25.30.tgz
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141227/2c30368e/attachment.asc>
