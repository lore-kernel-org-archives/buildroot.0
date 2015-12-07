From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Dec 2015 09:56:54 +0100
Subject: [Buildroot] [git commit] gcr: needs host-intltool
Message-ID: <20151207085720.5AEDA81991@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=628ed93368c1fb48b6c60482da7e95d95ff7f722
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c31/c3177224ca2488cf4740a2d22d1a861872d2dcde/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcr/gcr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 0730eb4..a89f874 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -8,7 +8,7 @@ GCR_VERSION_MAJOR = 3.18
 GCR_VERSION = $(GCR_VERSION_MAJOR).0
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
-GCR_DEPENDENCIES = host-pkgconf libgcrypt libglib2 p11-kit
+GCR_DEPENDENCIES = host-intltool host-pkgconf libgcrypt libglib2 p11-kit
 GCR_INSTALL_STAGING = YES
 GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
 GCR_CONF_OPTS = \
