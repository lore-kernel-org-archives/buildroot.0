From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jun 2021 18:27:11 +0200
Subject: [Buildroot] [git commit] package/filemq: bump to
 af4768dcaf2fcb8083a32bad107a22ecb7a5d954
Message-ID: <20210620155803.5E13F8B2DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12551386027dd559554bc70e1c6b644f9af37016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will drop -Werror to fix build failure with -DNDEBUG raised
since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

Fixes:
 - http://autobuild.buildroot.org/results/cf4c45ed7ae2c5090ac6ba967497e0d42d5c5224

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/filemq/filemq.hash | 2 +-
 package/filemq/filemq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
index 611d19208e..cf81eb4f50 100644
--- a/package/filemq/filemq.hash
+++ b/package/filemq/filemq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f3764e1adacfbf7fd09fb9c553e796a80d8159f1ace689fb68307afbc1746d4c  filemq-8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0.tar.gz
+sha256  bdec8584a181e1c9a1d9be567768bcf8c3f7132ea701dd1829f74370c6536991  filemq-af4768dcaf2fcb8083a32bad107a22ecb7a5d954.tar.gz
 sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  LICENSE
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 75d8bd992c..665d6da212 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0
+FILEMQ_VERSION = af4768dcaf2fcb8083a32bad107a22ecb7a5d954
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
