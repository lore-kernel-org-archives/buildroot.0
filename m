From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Oct 2019 09:59:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/ccid: bump version to 1.4.31
Message-ID: <20191027085947.23760-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://salsa.debian.org/rousseau/CCID/blob/master/README.md
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ccid/ccid.hash | 2 +-
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index 6938eb5f18..f29f5b3f93 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ac17087be08880a0cdf99a8a2799a4ef004dc6ffa08b4d9b0ad995f39a53ff7c  ccid-1.4.30.tar.bz2
+sha256 6b48d7b6e4390e038d25630f8664fe81618ab00f232d6efbe0e3cc6df28ce8f7  ccid-1.4.31.tar.bz2
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index b4cc0f5881..a5f9f00473 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.30
+CCID_VERSION = 1.4.31
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
-- 
2.20.1
