From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:25:52 +0200
Subject: [Buildroot] [git commit] libcgi: add license file (with its hash)
Message-ID: <20180428132845.B152E7FC35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d74f04a8df1bd0a23ab1ca18f3224ebc90cc4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcgi/libcgi.hash | 3 +++
 package/libcgi/libcgi.mk   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
index 3d9f791ed2..f071cc0aea 100644
--- a/package/libcgi/libcgi.hash
+++ b/package/libcgi/libcgi.hash
@@ -1,2 +1,5 @@
 # From https://github.com/rafaelsteil/libcgi/releases/download/v1.1/libcgi-1.1.tar.gz.sha256sum
 sha256  128445f2f828e84905d51bd53d11e2e08c489df3a07225ff9f198c1318092fe6  libcgi-1.1.tar.gz
+
+# Hash for license file:
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 0d51de7542..d1e403fdf1 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -9,5 +9,6 @@ LIBCGI_SITE = https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_
 
 LIBCGI_INSTALL_STAGING = YES
 LIBCGI_LICENSE = LGPL-2.1+
+LIBCGI_LICENSE_FILES = COPYING
 
 $(eval $(cmake-package))
