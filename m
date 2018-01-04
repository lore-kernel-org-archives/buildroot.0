From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu,  4 Jan 2018 21:36:28 +0300
Subject: [Buildroot] [PATCH 2/2] xradio: bump version to 33f4b1c2
In-Reply-To: <20180104183628.3913-1-geomatsi@gmail.com>
References: <20180104183628.3913-1-geomatsi@gmail.com>
Message-ID: <20180104183628.3913-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Out-of-tree driver has been updated according to mac80211
and timer API changes in the upcoming Linux v4.15.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 75e3c496bd..869801cad6 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 91095bd2d49d54c5e26919dc0c767be56eb0a2430c133d0bacdc814e97a5df4c xr819-xradio-c03a053a9e731d56c89c0c09627e886db2a0e04e.tar.gz
+sha256 7b78fc61d13a428a0d8a3d8dcffaa604d23b5a17c6e8e86d2e5e8372dcd17672 xr819-xradio-33f4b1c25eff0d9db7cbac19f36b130da9857f37.tar.gz
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 429c665dea..edf423bc3c 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = c03a053a9e731d56c89c0c09627e886db2a0e04e
+XR819_XRADIO_VERSION = 33f4b1c25eff0d9db7cbac19f36b130da9857f37
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.11.0
