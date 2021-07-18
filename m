From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:26:40 +0200
Subject: [Buildroot] [git commit] package/flannel: bump version to 0.14.0
Message-ID: <20210718205319.8CB43882DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a9f273b6730bbf027200ddd662748a26fcabb922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump flannel version from 0.12.0 to 0.14.0.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
