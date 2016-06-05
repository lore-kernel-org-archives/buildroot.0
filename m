From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:12 +0200
Subject: [Buildroot] [PATCH 19/28] package/v4l2grab: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/v4l2grab/v4l2grab.hash | 2 +-
 package/v4l2grab/v4l2grab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2grab/v4l2grab.hash b/package/v4l2grab/v4l2grab.hash
index 17beeec..a59c8af 100644
--- a/package/v4l2grab/v4l2grab.hash
+++ b/package/v4l2grab/v4l2grab.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ed5b9ca16c3b82d283df69c46aabd6c976b166b4e77b660288d86a147b68caf9	v4l2grab-6a52a234e227a30e16591d1a0e7afc52a2c5d964.tar.gz
+sha256 9a8d0d1ca5ac9fb9f66e00300bb3265d156cf1cb67eb30f6e6637c83b0b507a1 v4l2grab-f8d8844d52387b3db7b8736f5e86156d9374f781.tar.gz
diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
index b6f26c6..f3a8967 100644
--- a/package/v4l2grab/v4l2grab.mk
+++ b/package/v4l2grab/v4l2grab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2GRAB_VERSION = 6a52a234e227a30e16591d1a0e7afc52a2c5d964
+V4L2GRAB_VERSION = f8d8844d52387b3db7b8736f5e86156d9374f781
 V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
 V4L2GRAB_LICENSE = GPLv2+
 V4L2GRAB_LICENSE_FILES = LICENSE.md
-- 
2.8.1
