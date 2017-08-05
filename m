From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:29:17 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/luv: bump version to 1.9.1-1
Message-ID: <20170805092918.11608-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 140fe9638..44f4048df 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2eab80360f8ab6793612bb59d067a56664ac9a5a14988e0a09a53d0bff20c131  luv-1.9.1-0.tar.gz
+sha256 1051cfbdc361d5ea6d978fd71273b94c8a5007d76af498b456b297b18de9622c  luv-1.9.1-1.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 43cecf57f..633bfe689 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.9.1-0
+LUV_VERSION = 1.9.1-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.11.0
