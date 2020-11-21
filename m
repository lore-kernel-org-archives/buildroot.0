From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 13:20:13 +0100
Subject: [Buildroot] [PATCH/next 4/5] package/tvheadend: bump version
In-Reply-To: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
References: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
Message-ID: <20201121122014.1508936-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index d4dbc40067..b987a735eb 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  28cae1960135f9485907a5bea857963d5625fc374371d12320353f824ce70a06  tvheadend-6b8f014c39703640a1fe8af9c2b7663588ed2b56.tar.gz
+sha256  b5e58601da7af383c2c7f27016417a478be0d302a4a8a00ec87fc8bdacc56ef1  tvheadend-febcf9818d7c37fec8a98d424934edcb3243d5e4.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index de1de4af86..e19763e186 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 6b8f014c39703640a1fe8af9c2b7663588ed2b56
+TVHEADEND_VERSION = febcf9818d7c37fec8a98d424934edcb3243d5e4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.27.0
