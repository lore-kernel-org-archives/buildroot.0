From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:12:06 +0100
Subject: [Buildroot] [git commit] package/libiconv: typo
Message-ID: <20150304211223.0C988817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18bb40c075bc3479f9b260f3ff8658ee866a2823
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiconv/libiconv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index af55b60..f014da0 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -12,7 +12,7 @@ LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 # Don't build the preloadable library, as we don't need it (it's only
 # for LD_PRELOAD to replace glibc's iconv, but we never build libiconv
-# when glibc is ued). And it causes problems for static only builds.
+# when glibc is used). And it causes problems for static only builds.
 define LIBICONV_DISABLE_PRELOAD
 	$(SED) '/preload/d' $(@D)/Makefile.in
 endef
