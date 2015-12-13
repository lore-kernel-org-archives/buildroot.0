From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 16:02:21 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump version, add hash
Message-ID: <20151213150229.9C2657F934@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ea683df76fbafd506257a78a6df47c5446fe41f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 ++
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
new file mode 100644
index 0000000..9a8432a
--- /dev/null
+++ b/package/tvheadend/tvheadend.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	28b01f22f2d8efa201a782c1fbac68e4818e8982fd02c51497f492c9e547da67	tvheadend-66e5d277a59db723a8718afb3bdbef63824fa050.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 8177057..5f28d4a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 676a34f24b182928770cef5d4ba2903a6a25323d
+TVHEADEND_VERSION = 66e5d277a59db723a8718afb3bdbef63824fa050
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
