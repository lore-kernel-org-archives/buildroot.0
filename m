From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  5 Jul 2020 15:27:53 -0300
Subject: [Buildroot] [PATCH] package/ccid: bump version to 1.4.33
Message-ID: <20200705182753.24187-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/ccid/ccid.hash | 4 ++--
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index f29f5b3f93dc..f129d2ae903d 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6b48d7b6e4390e038d25630f8664fe81618ab00f232d6efbe0e3cc6df28ce8f7  ccid-1.4.31.tar.bz2
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+sha256  5256da939711deb42b74d05d2bd6bd0c73c4d564feb0c1a50212609eb680e424  ccid-1.4.33.tar.bz2
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index a5f9f00473c8..570c3907e887 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.31
+CCID_VERSION = 1.4.33
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
-- 
2.17.1
