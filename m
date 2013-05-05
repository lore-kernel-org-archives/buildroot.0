From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 22:42:45 +0200
Subject: [Buildroot] [PATCH 1/1] webp: new package
In-Reply-To: <1359088553-11261-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Thu, 24 Jan 2013 20:35:53 -0800")
References: <1359088553-11261-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87ip2xma4a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/Config.in      |    1 +
 Gilles>  package/webp/Config.in |    7 +++++++
 Gilles>  package/webp/webp.mk   |   30 ++++++++++++++++++++++++++++++
 Gilles>  3 files changed, 38 insertions(+), 0 deletions(-)
 Gilles>  create mode 100644 package/webp/Config.in
 Gilles>  create mode 100644 package/webp/webp.mk

 Gilles> diff --git a/package/Config.in b/package/Config.in
 Gilles> index ebd9817..95d51fb 100644
 Gilles> --- a/package/Config.in
 Gilles> +++ b/package/Config.in
 Gilles> @@ -437,6 +437,7 @@ source "package/pango/Config.in"
 Gilles>  source "package/pixman/Config.in"
 Gilles>  source "package/tiff/Config.in"
 Gilles>  source "package/webkit/Config.in"
 Gilles> +source "package/webp/Config.in"
 Gilles>  source "package/zxing/Config.in"
 Gilles>  endmenu
 
 Gilles> diff --git a/package/webp/Config.in b/package/webp/Config.in
 Gilles> new file mode 100644
 Gilles> index 0000000..dcee8aa
 Gilles> --- /dev/null
 Gilles> +++ b/package/webp/Config.in
 Gilles> @@ -0,0 +1,7 @@
 Gilles> +config BR2_PACKAGE_WEBP
 Gilles> +       bool "webp"
 Gilles> +       help
 Gilles> +         WebP is a new image format that provides lossless and
 Gilles> +         lossy compression for images on the web
 Gilles> +
 Gilles> +         https://developers.google.com/speed/webp/

Config.in files should be indented with <tab> (and help lines with
<tab><space><space>).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
