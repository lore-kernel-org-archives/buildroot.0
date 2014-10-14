From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 17:27:46 +0200
Subject: [Buildroot] [git commit] libcdio: bump to version 0.93
Message-ID: <20141015125351.BB64EB2DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6184fbac83fcfb789fd939985507945ebb6d203a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdio/libcdio.hash |    2 ++
 package/libcdio/libcdio.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
new file mode 100644
index 0000000..cc87ffb
--- /dev/null
+++ b/package/libcdio/libcdio.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking signature
+sha256	4972cd22fd8d0e8bff922d35c7a645be0db0ab0e7b3dfaecc9cd8272429d6975	libcdio-0.93.tar.gz
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 10559a7..03e6002 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 0.92
+LIBCDIO_VERSION = 0.93
 LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPLv3+
