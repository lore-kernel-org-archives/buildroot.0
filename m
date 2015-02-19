From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:31:34 +0100
Subject: [Buildroot] [git commit branch/next] wayland: bump version to 1.7.0
Message-ID: <20150219213237.19413817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36b8b52598ee545587c5d2a4184b583ae28af7bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump version to 1.7.0
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland/wayland.hash |    2 ++
 package/wayland/wayland.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
