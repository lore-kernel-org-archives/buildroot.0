From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Apr 2015 23:23:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/vlc: bump version to 2.2.1
In-Reply-To: <1429737809-17368-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429737809-17368-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429737809-17368-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.hash |    4 ++--
 package/vlc/vlc.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 7b84cef..ce124f3 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.0/vlc-2.2.0.tar.xz.sha256
-sha256  5e0a27e248c47da723a696420aca3a4dd15cc3ed8cc81618d3f1dc8661b25517  vlc-2.2.0.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.1/vlc-2.2.1.tar.xz.sha256
+sha256	543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb	vlc-2.2.1.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b937b79..ab9aaae 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.0
+VLC_VERSION = 2.2.1
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
-- 
1.7.10.4
