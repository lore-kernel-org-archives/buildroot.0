From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Jun 2015 18:46:09 +0200
Subject: [Buildroot] [PATCH 09/10] weston: bump to version 1.8.0
In-Reply-To: <1434645970-31995-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1434645970-31995-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1434645970-31995-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 1.8.0
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/weston/weston.hash | 4 ++--
 package/weston/weston.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 8df6f07..e7bc2bb 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-February/019977.html
-sha256  1c4511945f3f476c24af712e82a7b500ae91a99cbc0fe2e381da1449125166cd  weston-1.7.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-June/022416.html
+sha256  8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312  weston-1.8.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index bf49436..4ad89ce 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.7.0
+WESTON_VERSION = 1.8.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.3.6
