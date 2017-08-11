From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Aug 2017 15:49:35 +0200
Subject: [Buildroot] [git commit branch/next] package/libhttpparser: bump
	version to 2.7.1
Message-ID: <20170811135811.719987FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b719de9d3c1c2a32f8dc2486695c6d71293a0d4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libhttpparser/libhttpparser.hash | 2 +-
 package/libhttpparser/libhttpparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index e11006e..a1b772e 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 a11c5ccb9808496f3de66d54ea1f89271919923307e31c75de2a3a77a6754c97 libhttpparser-v2.6.0.tar.gz
+sha256 70409ad324e5de2da6a0f39e859e566d497c1ff0a249c0c38a5012df91b386b3  libhttpparser-v2.7.1.tar.gz
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 015efc0..8ff0413 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = v2.6.0
+LIBHTTPPARSER_VERSION = v2.7.1
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
