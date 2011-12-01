From: Daniel Mack <zonque@gmail.com>
Date: Thu, 01 Dec 2011 12:57:33 +0100
Subject: [Buildroot] [PATCH v2 1/5] libnl: bump to version 3.2.3
In-Reply-To: <1322740594-13595-1-git-send-email-zonque@gmail.com>
References: <1322740594-13595-1-git-send-email-zonque@gmail.com>
Message-ID: <4ED76BAD.7000105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2011 12:56 PM, Daniel Mack wrote:
> This newer version splits the library code into libnl, libnl-route,
> libnl-genl and libnl-nf, each individually selectable via pkgconfig.

Forgot to mention that this series is made for the 'next' branch.



> 
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
>  package/libnl/libnl.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
> index dd0d7fb..612908b 100644
> --- a/package/libnl/libnl.mk
> +++ b/package/libnl/libnl.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  
> -LIBNL_VERSION = 3.0
> +LIBNL_VERSION = 3.2.3
>  LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
>  LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
>  LIBNL_INSTALL_STAGING = YES
