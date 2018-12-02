From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Dec 2018 14:00:53 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: bump to version 2.58.1
In-Reply-To: <20181014075852.2976-1-fontaine.fabrice@gmail.com>
References: <20181014075852.2976-1-fontaine.fabrice@gmail.com>
Message-ID: <20181202140053.6ed28a05@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Oct 2018 09:58:52 +0200, Fabrice Fontaine wrote:
> - Update second patch
> - Remove third and fifth patches (already in version)
> - Add a new patch to fix a missing header
> - Add LIBGLIB2_GTK_DOC_HOOK so autoreconf do not fail on the following
>   error:
>   automake: error: cannot open < gtk-doc.make: No such file or directory
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libglib2/0002-disable-tests.patch     |  8 +--
>  ...code-python-path-into-various-tools.patch} |  0
>  ...gobject-fix-compilation-with-gcc-4.7.patch | 50 ------------------
>  ...0004-grefcount-add-missing-gatomic.h.patch | 38 ++++++++++++++
>  ...compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 -------------------
>  package/libglib2/libglib2.hash                |  4 +-
>  package/libglib2/libglib2.mk                  | 11 +++-
>  7 files changed, 55 insertions(+), 108 deletions(-)
>  rename package/libglib2/{0004-Do-not-hardcode-python-path-into-various-tools.patch => 0003-Do-not-hardcode-python-path-into-various-tools.patch} (100%)
>  delete mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
>  create mode 100644 package/libglib2/0004-grefcount-add-missing-gatomic.h.patch
>  delete mode 100644 package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
