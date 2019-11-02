From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 22:32:06 +0100
Subject: [Buildroot] [PATCH 7/9] package/s6-networking: bump version to
 2.3.1.1
In-Reply-To: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
References: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102213208.27075-8-eric.le.bihan.dev@free.fr>
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
index a15f8f3ec7..41ceda0c05 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 814fa3b70718d2423c742e920d31f64088272f7987c2cf7bebc86a63a75596b8  s6-networking-2.3.1.0.tar.gz
+sha256 9d411b5f742529be8e14da0a21635fcc304a4d7ac05fe0e45cf2355e5e3cf188  s6-networking-2.3.1.1.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index f2228daae3..c23445b967 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.3.1.0
+S6_NETWORKING_VERSION = 2.3.1.1
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
-- 
2.21.0
