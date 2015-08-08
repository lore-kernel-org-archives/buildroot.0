From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:16 -0000
Subject: [Buildroot] [git commit branch/next] weston: bump to version 1.8.0
Message-ID: <20150808105612.72DCF8030B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dca75e36c93eaa46e974d498d728a87c69a52eab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump to version 1.8.0
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.hash |    4 ++--
 package/weston/weston.mk   |    2 +-
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
