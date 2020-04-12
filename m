From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 10:41:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/mdevd: bump version to 0.1.1.2
In-Reply-To: <20200412084121.867943-1-bernd.kuhls@t-online.de>
References: <20200412084121.867943-1-bernd.kuhls@t-online.de>
Message-ID: <20200412084121.867943-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash due to copyright year bump:
http://git.skarnet.org/cgi-bin/cgit.cgi/mdevd/commit/?id=00b25940f6d0458f45ab36ddaff2a1c6d208b6fa

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mdevd/mdevd.hash | 4 ++--
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 2b36740fb4..6852e55f8e 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 ad93048afbd8394d709da35934a62ef5826143b6baa13d37115a3b265f9038b7  mdevd-0.1.1.1.tar.gz
-sha256 2e59eb9754eaece119072a4379d8b320900cc8c4a1a488d2d7788768b95e89ae  COPYING
+sha256 c926b6f9f9f48a73733397f08b6c299a8a2f0eff3d729de7f9d0a763757dab2a  mdevd-0.1.1.2.tar.gz
+sha256 6e32cf6ae38bb82bb8462915ae72d55de59741c8227ae0a637b4012687d9a739  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index 48de724924..728c766643 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.1.1
+MDEVD_VERSION = 0.1.1.2
 MDEVD_SITE = http://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
-- 
2.25.0
