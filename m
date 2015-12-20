From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Dec 2015 10:40:36 -0300
Subject: [Buildroot] [PATCH 4/4] weston: bump to version 1.9.0
In-Reply-To: <1450618836-3845-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450618836-3845-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450618836-3845-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.hash | 4 ++--
 package/weston/weston.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index e7bc2bb..32035c9 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-June/022416.html
-sha256  8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312  weston-1.8.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-September/024303.html
+sha256  9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf  weston-1.9.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 4ad89ce..392fbb1 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.8.0
+WESTON_VERSION = 1.9.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.4.10
