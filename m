From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:10:13 +0200
Subject: [Buildroot] [PATCH 06/10] package/s6-networking: bump version to
 2.3.1.0
In-Reply-To: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171017.26831-7-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-networking/s6-networking.hash | 2 +-
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 46f88e038c..0c7d78bd12 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 d81968756abbcecde6a872c89d82f643cd621a0c295c2c57650705dbe875481a  s6-networking-2.3.0.2.tar.gz
+sha256 814fa3b70718d2423c742e920d31f64088272f7987c2cf7bebc86a63a75596b8  s6-networking-2.3.1.0.tar.gz
 sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index b621eb225d..f2228daae3 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.3.0.2
+S6_NETWORKING_VERSION = 2.3.1.0
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
-- 
2.21.0
