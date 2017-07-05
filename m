From: Romain Naour <romain.naour@smile.fr>
Date: Wed,  5 Jul 2017 10:19:57 +0200
Subject: [Buildroot] [PATCH] package/filemq: bump to the latest master
Message-ID: <20170705081957.10639-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump include a patch that fixes a build issue with gcc >= 7.1.

Fixes:
http://autobuild.buildroot.net/results/434/43452430edf44cbcef6ea3a5ab80ac0ff406208f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/filemq/filemq.hash | 2 +-
 package/filemq/filemq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
index d76d009..d1df1ff 100644
--- a/package/filemq/filemq.hash
+++ b/package/filemq/filemq.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a9973117f8afea6d4cbde95e4d7f46ab90d67cb0d72e42165410d665bf1765c1  filemq-3dc89932903b0320853d87833aabc6f7e7781c49.tar.gz
+sha256 f3764e1adacfbf7fd09fb9c553e796a80d8159f1ace689fb68307afbc1746d4c  filemq-8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0.tar.gz
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 581e8a8..75d8bd9 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 3dc89932903b0320853d87833aabc6f7e7781c49
+FILEMQ_VERSION = 8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
-- 
2.9.4
