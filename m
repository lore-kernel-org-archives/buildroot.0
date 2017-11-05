From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Nov 2017 20:15:36 +0100
Subject: [Buildroot] [git commit] package/xr819-xradio: update to the latest
 version
Message-ID: <20171105192817.E0C3C810CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d80fc8a37ace4230ebccaa79d0281358bd2e514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel module git revision to make it work with Linux v4.13.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index bdb0f96..75e3c49 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5e9f59942b3880768b4812ab6db395bd1fa6d423cae9c09504baa416f064a10d xr819-xradio-014dfdd203102c5fd2370a73ec4ae3e6dd4e9ded.tar.gz
+sha256 91095bd2d49d54c5e26919dc0c767be56eb0a2430c133d0bacdc814e97a5df4c xr819-xradio-c03a053a9e731d56c89c0c09627e886db2a0e04e.tar.gz
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index dfe2ee6..429c665 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 014dfdd203102c5fd2370a73ec4ae3e6dd4e9ded
+XR819_XRADIO_VERSION = c03a053a9e731d56c89c0c09627e886db2a0e04e
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
