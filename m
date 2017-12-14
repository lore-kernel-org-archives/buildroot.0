From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 14 Dec 2017 23:25:58 +0100
Subject: [Buildroot] [PATCH 4/4] s6-rc: bump version to 0.3.0.1
In-Reply-To: <20171214222558.14148-1-eric.le.bihan.dev@free.fr>
References: <20171214222558.14148-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171214222558.14148-5-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-rc/s6-rc.hash | 2 +-
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 7ee13876f5..4c6e32a647 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 78266a397330d35d5eac9e99d1436feba58e36f41bfe1db0fd16c4b6cc73c999  s6-rc-0.3.0.0.tar.gz
+sha256 ac0afe7adb3be24e3d0bd7ff1ed1011018751699669ce763a9562ab336fc7428  s6-rc-0.3.0.1.tar.gz
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index e651814a15..4a940ae0b6 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.3.0.0
+S6_RC_VERSION = 0.3.0.1
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
-- 
2.14.3
