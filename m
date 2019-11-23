From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 11:55:23 +0100
Subject: [Buildroot] [PATCH-NEXT] package/fatcat: bump version to 1.1.0
Message-ID: <20191123105524.4236-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tag now has a 'v' prefix, so handle that in the github macro.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fatcat/fatcat.hash | 2 +-
 package/fatcat/fatcat.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fatcat/fatcat.hash b/package/fatcat/fatcat.hash
index a5a6f670ad..66823e2d9e 100644
--- a/package/fatcat/fatcat.hash
+++ b/package/fatcat/fatcat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 d44f6bb80d20ed50095ace9e71df8da98037db9f22cda76bdd9724d37df69130  fatcat-1.0.6.tar.gz
+sha256 303efe2aa73cbfe6fbc5d8af346d0f2c70b3f996fc891e8859213a58b95ad88c  fatcat-1.1.0.tar.gz
 sha256 3ea03755e32cf7f5b12981de92a0fdad396448195fe0024990c9cbc388e9866c  LICENSE
diff --git a/package/fatcat/fatcat.mk b/package/fatcat/fatcat.mk
index e4f8d757b6..1a2e5aacae 100644
--- a/package/fatcat/fatcat.mk
+++ b/package/fatcat/fatcat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FATCAT_VERSION = 1.0.6
-FATCAT_SITE = $(call github,Gregwar,fatcat,$(FATCAT_VERSION))
+FATCAT_VERSION = 1.1.0
+FATCAT_SITE = $(call github,Gregwar,fatcat,v$(FATCAT_VERSION))
 FATCAT_LICENSE = MIT
 FATCAT_LICENSE_FILES = LICENSE
 
-- 
2.20.1
