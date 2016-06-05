From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:30:23 +0200
Subject: [Buildroot] [git commit] package/axfsutils: bump version
Message-ID: <20160605200529.D44E981E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9508e10a05d139d2b5d2a9e52dcdd9c4d446437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axfsutils/axfsutils.hash | 2 +-
 package/axfsutils/axfsutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
index 4a3b3fb..bde94a0 100644
--- a/package/axfsutils/axfsutils.hash
+++ b/package/axfsutils/axfsutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9c041393131bdfebefa89cfaba7788b514b56ffc51bda8f130fd49b39fe89dc0 axfsutils-f26ae785e33df76f658b71ef2cfbc7f511ff875d.tar.gz
+sha256 80dd97305b005262643e9fad04ec03b860430ea2c58666ce5b007897afbc9693 axfsutils-64886703fdff6cfc64eb20fbe7d7295bbeec867b.tar.gz
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index 4dd60ef..6c9c58b 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXFSUTILS_VERSION = f26ae785e33df76f658b71ef2cfbc7f511ff875d
+AXFSUTILS_VERSION = 64886703fdff6cfc64eb20fbe7d7295bbeec867b
 AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
 AXFSUTILS_LICENSE = GPLv2
 AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
