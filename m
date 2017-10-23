From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 23 Oct 2017 21:52:03 +0200
Subject: [Buildroot] [PATCH 4/4] s6-rc: bump version to 0.3.0.0
In-Reply-To: <20171023195203.6775-1-eric.le.bihan.dev@free.fr>
References: <20171023195203.6775-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171023195203.6775-5-eric.le.bihan.dev@free.fr>
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
index c39629b3d4..7ee13876f5 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 4fa35cf8af41498c9fa0c21220dcdc7595a18ebc2975a254d719f7e1c864b1f0  s6-rc-0.2.1.2.tar.gz
+sha256 78266a397330d35d5eac9e99d1436feba58e36f41bfe1db0fd16c4b6cc73c999  s6-rc-0.3.0.0.tar.gz
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 9330c03b1e..e651814a15 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.2.1.2
+S6_RC_VERSION = 0.3.0.0
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
-- 
2.13.6
