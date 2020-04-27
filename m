From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:58:16 +0200
Subject: [Buildroot] [git commit] package/flannel: bump version to 0.12.0
Message-ID: <20200427194802.C072490917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5ad2f9f5b8f0f1de0a5cc3bcf265c436d0872b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump flannel version from 0.5.5 to 0.12.0.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 57c2daf6dc..8195140f8e 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 dbbcb08c0e70713b0c920387a9967e5b30ef833c8118c847edbbca4f68ff0562 v0.5.5.tar.gz
+sha256 7375318b288bcff733aabfe1a1007d478cb9091cdaffe68c8253ddd93bc070ed v0.12.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 0af06c7656..8aa960f086 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.5.5
+FLANNEL_VERSION = 0.12.0
 FLANNEL_SITE = https://github.com/coreos/flannel/archive
 FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
