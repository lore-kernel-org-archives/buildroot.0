From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  7 Jan 2018 20:08:47 +0100
Subject: [Buildroot] [PATCH 3/9] s6-rc: bump version to 0.4.0.0
In-Reply-To: <20180107190853.15382-1-eric.le.bihan.dev@free.fr>
References: <20180107190853.15382-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180107190853.15382-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-rc/s6-rc.hash | 3 ++-
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 4c6e32a647..76ab69df18 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 ac0afe7adb3be24e3d0bd7ff1ed1011018751699669ce763a9562ab336fc7428  s6-rc-0.3.0.1.tar.gz
+sha256 96b8e7f275d42113b9ba7ef1d8856f64183b9421c39702f8332e6f5686496fba  s6-rc-0.4.0.0.tar.gz
+sha256 1377d3b18a31de11e8bb06f0f46888a23bc16cbc57285035793bf7e7943bbcb3  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 4a940ae0b6..396adaeaf4 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.3.0.1
+S6_RC_VERSION = 0.4.0.0
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
-- 
2.14.3
