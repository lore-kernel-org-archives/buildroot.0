From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Jun 2020 09:11:48 +0200
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2020.05
Message-ID: <20200606071149.1994707-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 29c6ce77f..7c8a52bc7 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 82cb80b29ad7aebb0c0b42449d371eafa8935b07884526345f9788c8bcf4d632  MoarVM-2020.02.1.tar.gz
+sha256 9368d2c691ea8710459a48c323915df6648c4a67d2ce24c27fc74f6b084a824b  MoarVM-2020.05.tar.gz
 sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index a0c7766bf..4e8ca9190 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.02.1
+MOARVM_VERSION = 2020.05
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.25.1
