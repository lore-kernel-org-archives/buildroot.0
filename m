From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Apr 2021 11:15:42 +0200
Subject: [Buildroot] [git commit] package/terminology: bump to version 1.9.0
Message-ID: <20210429084946.9FEE684197@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ac557a54bb4613e79728ad96724e7681c9c3c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://www.enlightenment.org/news/2021-01-18-terminology-1.9.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 5dee767db1..be1d6f4269 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.8.1.tar.xz.sha256sum
-sha256  04a69ac8ade443cba7dae20f82bbaa431fd155cec60c133b263d82f18e93b8bb  terminology-1.8.1.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.9.0.tar.xz.sha256sum
+sha256  3f3bc327da5cc239d468570afed29a17e2fda3b1fee02b28f02ee7ed5141e46c  terminology-1.9.0.tar.xz
 sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index d93e348781..9fac4d2775 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.8.1
+TERMINOLOGY_VERSION = 1.9.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
