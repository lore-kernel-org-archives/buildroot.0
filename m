From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Oct 2012 12:28:22 +0100
Subject: [Buildroot] [PATCH 1/1] Bump version to 2.9.0
In-Reply-To: <1351379690-17391-1-git-send-email-sagaert.johan@skynet.be>
References: <1351379690-17391-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20121028122822.37d10ffc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

Please include the name of the package in the title, i.e:

	libxml2: bump version to 2.9.0

Thanks,

Thomas

On Sun, 28 Oct 2012 01:14:50 +0200, Sagaert Johan wrote:
> 
> Bump version from 2.8.0 -> 2.9.0
> Many bug fixes and improvements.
> Visit http://www.xmlsoft.org/news.html for more details.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/libxml2/libxml2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index b63200f..91042fa 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  
> -LIBXML2_VERSION = 2.8.0
> +LIBXML2_VERSION = 2.9.0
>  LIBXML2_SITE = ftp://xmlsoft.org/libxml2
>  LIBXML2_INSTALL_STAGING = YES
>  LIBXML2_AUTORECONF = YES



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
