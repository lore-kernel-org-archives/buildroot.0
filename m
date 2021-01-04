From: David GOUARIN <dgouarin@gmail.com>
Date: Mon,  4 Jan 2021 17:49:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/librelp: bump to version 1.9.0
Message-ID: <20210104164954.8645-1-david.gouarin@thalesgroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
---
 package/librelp/librelp.hash | 2 +-
 package/librelp/librelp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
index bd66ad7db0..88665bcf2a 100644
--- a/package/librelp/librelp.hash
+++ b/package/librelp/librelp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cdbf49115fa530247358489864c5971c9f5a6442d19490e38f4c4ef844f1c264  librelp-1.8.0.tar.gz
+sha256  24ee9e843960d1400a44ffaedb0b1ec91463df8f8acca869cc027ed25ee6bf33  librelp-1.9.0.tar.gz
 sha256  1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685  COPYING
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index e9e879d1f6..2b8a53e833 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRELP_VERSION = 1.8.0
+LIBRELP_VERSION = 1.9.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
-- 
2.17.1
