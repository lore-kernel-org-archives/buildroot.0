From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 16:54:13 +0100
Subject: [Buildroot] [PATCH 1/1] infozip: new package
In-Reply-To: <1358170201-26050-1-git-send-email-jp@jp-embedded.com> (Jan
 Pedersen's message of "Mon, 14 Jan 2013 14:30:00 +0100")
References: <1358170201-26050-1-git-send-email-jp@jp-embedded.com>
Message-ID: <874nijsqu2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Pedersen <jp@jp-embedded.com> writes:

 Jan> This commit adds a package for infozip, compression and file
 Jan> packaging/archive utility.

 Jan> Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
 Jan> ---
 Jan>  package/Config.in          |    1 +
 Jan>  package/infozip/Config.in  |   10 ++++++++++
 Jan>  package/infozip/infozip.mk |   20 ++++++++++++++++++++
 Jan>  3 files changed, 31 insertions(+)
 Jan>  create mode 100644 package/infozip/Config.in
 Jan>  create mode 100644 package/infozip/infozip.mk

 Jan> diff --git a/package/Config.in b/package/Config.in
 Jan> index 4f05665..ad2a742 100644
 Jan> --- a/package/Config.in
 Jan> +++ b/package/Config.in
 Jan> @@ -11,6 +11,7 @@ source "package/bzip2/Config.in"
 Jan>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Jan>  source "package/gzip/Config.in"
 Jan>  endif
 Jan> +source "package/infozip/Config.in"
 Jan>  source "package/lzop/Config.in"
 Jan>  source "package/lzma/Config.in"
 Jan>  source "package/xz/Config.in"
 Jan> diff --git a/package/infozip/Config.in b/package/infozip/Config.in
 Jan> new file mode 100644
 Jan> index 0000000..1a4b756
 Jan> --- /dev/null
 Jan> +++ b/package/infozip/Config.in
 Jan> @@ -0,0 +1,10 @@
 Jan> +config BR2_PACKAGE_INFOZIP
 Jan> +	bool "infozip"
 Jan> +	help
 Jan> +	  Zip is a compression and file packaging/archive utility. 
 Jan> +	  Although highly compatible both with PKWARE's PKZIP and 
 Jan> +	  PKUNZIP utilities for MS-DOS and with Info-ZIP's own UnZip, 
 Jan> + 	  our primary objectives have been portability and other-than-MSDOS 
 Jan> +	  functionality. 

Trailing spaces an strange indentation / long line. I've fixed that up
and committed, thanks.

-- 
Bye, Peter Korsgaard
