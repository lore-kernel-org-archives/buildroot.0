From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:34 -0300
Subject: [Buildroot] [PATCH 1/9] wayland-protocols: bump to version 1.7
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wayland-protocols/wayland-protocols.hash | 4 ++--
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 380581b..a316698 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/029014.html
-sha256	014a9a23c21ed14f49b1005b3e8efa66d6337d4ceafc97f7b0d6707e7e3df572	wayland-protocols-1.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-August/030606.html
+sha256	635f2a937d318f1fecb97b54074ca211486e38af943868dd0fa82ea38d091c1f	wayland-protocols-1.7.tar.xz
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 51ee9ee..54c2ec1 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.4
+WAYLAND_PROTOCOLS_VERSION = 1.7
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.7.3
