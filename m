From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 12:28:06 +0200
Subject: [Buildroot] [git commit] package/libhttpparser: bump to version
 2.9.4
Message-ID: <20200412101444.1B33A8E5D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37a5ffc275cefe2eff92f39dd0d3a713194a7984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

2343fd6 v2.9.4
714cbb2 Fix ABI breakage
1c02cb9 Correct test name and numbering

And update hash file formatting (2 spaces).

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libhttpparser/libhttpparser.hash | 4 ++--
 package/libhttpparser/libhttpparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index 4634b06620..6ab63e8209 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 8fa0ab8770fd8425a9b431fdbf91623c4d7a9cdb842b9339289bd2b0b01b0d3d  libhttpparser-2.9.3.tar.gz
-sha256 79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
+sha256  467b9e30fd0979ee301065e70f637d525c28193449e1b13fbcb1b1fab3ad224f  libhttpparser-2.9.4.tar.gz
+sha256  79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index d7b6907493..5cf7f77391 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = 2.9.3
+LIBHTTPPARSER_VERSION = 2.9.4
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,v$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
