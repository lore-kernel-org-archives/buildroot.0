From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:50 +0200
Subject: [Buildroot] [PATCH v7 30/31] package/libsquish: bump version to 1.15
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-31-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsquish/libsquish.hash | 3 ++-
 package/libsquish/libsquish.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libsquish/libsquish.hash b/package/libsquish/libsquish.hash
index caa7198642..e68d28d66f 100644
--- a/package/libsquish/libsquish.hash
+++ b/package/libsquish/libsquish.hash
@@ -1,2 +1,3 @@
 # From http://sourceforge.net/projects/libsquish/files
-sha1	7bcdd7d0f0460a29e25dcdab8dc41a30e58bb366	libsquish-1.13.tgz
+sha1 51844b9a8bc815a27e2cc0ffbede5fee3ef75110 libsquish-1.15.tgz
+md5 c02645800131e55b519ff8dbe7284f93 libsquish-1.15.tgz
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index 73f8de9cc1..a707355b55 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSQUISH_VERSION = 1.13
+LIBSQUISH_VERSION = 1.15
 LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tgz
 LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
 LIBSQUISH_INSTALL_STAGING = YES
-- 
2.11.0
