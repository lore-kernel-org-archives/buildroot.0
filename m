From: Geoff Levand <geoff@infradead.org>
Date: Tue, 22 Jun 2021 06:45:39 -0700
Subject: [Buildroot] [PATCH 2/2] package/flannel: bump version to 0.14.0
In-Reply-To: <cover.1623643496.git.geoff@infradead.org>
References: <cover.1623643496.git.geoff@infradead.org>
Message-ID: <759f8767-368e-07de-9432-ffc03d1ecf0b@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump flannel version from 0.12.0 to 0.14.0.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 8195140f8e..0d0f75e6b4 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 7375318b288bcff733aabfe1a1007d478cb9091cdaffe68c8253ddd93bc070ed v0.12.0.tar.gz
+sha256 e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca v0.14.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index a8a3c7a3cd..231cf90dfd 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.12.0
+FLANNEL_VERSION = 0.14.0
 FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
 FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
-- 
2.25.1
