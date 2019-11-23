From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:37:44 +0100
Subject: [Buildroot] [git commit] package/fatcat: bump version to 1.1.0
Message-ID: <20191202083934.627F47FAE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e5c2ec556a909d3996717c97b2752abfa529322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
