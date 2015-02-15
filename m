From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 15:44:10 +0000
Subject: [Buildroot] [PATCH 2/3] wayland: bump version to 1.7.0
In-Reply-To: <1424015051-14779-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424015051-14779-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1424015051-14779-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.7.0
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/wayland/wayland.hash |    2 ++
 package/wayland/wayland.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/wayland/wayland.hash

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
new file mode 100644
index 0000000..aa9b15d
--- /dev/null
+++ b/package/wayland/wayland.hash
@@ -0,0 +1,2 @@
+# From: http://lists.freedesktop.org/archives/wayland-devel/2015-February/019976.html
+sha256  bdea47a2db96f7e53f1ce0351559c0af5b7f7aae7e95f0a884a78af9f1057c9c  wayland-1.7.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 740faed..32869d8 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.6.0
+WAYLAND_VERSION = 1.7.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
1.7.1
