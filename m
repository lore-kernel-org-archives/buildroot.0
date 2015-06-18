From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Jun 2015 18:46:08 +0200
Subject: [Buildroot] [PATCH 08/10] wayland: bump to version 1.8.1
In-Reply-To: <1434645970-31995-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1434645970-31995-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1434645970-31995-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 1.8.1
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/wayland/wayland.hash | 4 ++--
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index aa9b15d..316d6b5 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,2 @@
-# From: http://lists.freedesktop.org/archives/wayland-devel/2015-February/019976.html
-sha256  bdea47a2db96f7e53f1ce0351559c0af5b7f7aae7e95f0a884a78af9f1057c9c  wayland-1.7.0.tar.xz
+# From: http://lists.freedesktop.org/archives/wayland-devel/2015-June/022630.html
+sha256  f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8 wayland-1.8.1.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 32869d8..4e44fa0 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.7.0
+WAYLAND_VERSION = 1.8.1
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.3.6
