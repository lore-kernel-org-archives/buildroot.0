From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Jun 2021 22:10:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/xmrig: bump version to 6.12.2
Message-ID: <20210601201000.683675-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index c80bdd6621..ad5763847d 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7570030c4b3e257bda190a100dc59f78b74c823af7561222a99b296f5e7b1ac2  xmrig-6.12.1.tar.gz
+sha256  7baca03d289f108883e5606c1a1d0287baf6a2425def48e5c413200b5db88bfa  xmrig-6.12.2.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 2202d875c5..cf9da18bcd 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.12.1
+XMRIG_VERSION = 6.12.2
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.29.2
