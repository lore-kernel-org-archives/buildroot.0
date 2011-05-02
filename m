From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 May 2011 17:41:44 +0200
Subject: [Buildroot] [PATCH] usbutils: install into staging directory
	(needed by udev)
In-Reply-To: <a1ee6c8c1a0d28005dfa4b6e8fff9bbe0637bf07.1304254799.git.smiley73@users.sourceforge.net>
	(heiko@zuerker.org's message of "Sun, 1 May 2011 08:00:14 -0500")
References: <a1ee6c8c1a0d28005dfa4b6e8fff9bbe0637bf07.1304254799.git.smiley73@users.sourceforge.net>
Message-ID: <8762ptun2f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "heiko" == heiko  <heiko@zuerker.org> writes:

 heiko> From: Heiko Zuerker <smiley73@users.sourceforge.net>
 heiko> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 heiko> ---
 heiko>  package/usbutils/usbutils.mk |    1 +
 heiko>  1 files changed, 1 insertions(+), 0 deletions(-)

 heiko> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
 heiko> index bd50a5f..a034ddc 100644
 heiko> --- a/package/usbutils/usbutils.mk
 heiko> +++ b/package/usbutils/usbutils.mk
 heiko> @@ -7,6 +7,7 @@
 heiko>  USBUTILS_VERSION = 002
 heiko>  USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 heiko>  USBUTILS_DEPENDENCIES = host-pkg-config libusb
 heiko> +USBUTILS_INSTALL_STAGING = YES

Out of interest, what is this for exactly? the .pc file or usb.ids?

Anyway, committed - Thanks.

-- 
Bye, Peter Korsgaard
