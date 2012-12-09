From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 09 Dec 2012 16:10:29 +0100
Subject: [Buildroot] [PATCH] tslib: add license info
In-Reply-To: <1354876163-30452-1-git-send-email-sho@relinux.de>
References: <1354876163-30452-1-git-send-email-sho@relinux.de>
Message-ID: <50C4A9E5.9060303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/12 11:29, Stephan Hoffmann wrote:
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
> ---
>   package/tslib/tslib.mk |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> index b10b5ec..9b51015 100644
> --- a/package/tslib/tslib.mk
> +++ b/package/tslib/tslib.mk
> @@ -5,6 +5,9 @@
>   #############################################################
>   TSLIB_VERSION = 412d99d
>   TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
> +TSLIB_LICENSE = LGPLv2

  The source files don't specify a version number. The COPYING file says:

If the Library does not specify a license version number, you may
choose any version ever published by the Free Software Foundation.


  In other words, it's LGPL.


  Regards,
  Arnout


> +TSLIB_LICENSE_FILES = COPYING
> +
>   TSLIB_AUTORECONF = YES
>   TSLIB_INSTALL_STAGING = YES
>   TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
