From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Sat, 12 Dec 2020 18:35:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libusb: bump to version 1.0.24
In-Reply-To: <20201211174325.78230-1-fontaine.fabrice@gmail.com>
References: <20201211174325.78230-1-fontaine.fabrice@gmail.com>
Message-ID: <4072307.ejJDZkT8p0@zgyarmati-w530>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020. december 11., p?ntek 18:43:25 CET Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/libusb/libusb/blob/v1.0.24/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libusb/libusb.hash | 4 ++--
>  package/libusb/libusb.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
> index 272dfb0877..6169a186a5 100644
> --- a/package/libusb/libusb.hash
> +++ b/package/libusb/libusb.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256 db11c06e958a82dac52cf3c65cb4dd2c3f339c8a988665110e0d24d19312ad8d 
> libusb-1.0.23.tar.bz2 -sha256
> 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> +sha256  7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a 
> libusb-1.0.24.tar.bz2 +sha256 
> 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index ddc6b27b6c..26e91e3da6 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -5,7 +5,7 @@
>  ###########################################################################
> #####
> 
>  LIBUSB_VERSION_MAJOR = 1.0
> -LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).23
> +LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).24
>  LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
>  LIBUSB_SITE =
> https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
> LIBUSB_LICENSE = LGPL-2.1+

Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201212/42ccea22/attachment.asc>
