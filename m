From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Feb 2015 16:10:37 +0000
Subject: [Buildroot] [PATCH] libvips: bump version to 7.42.2
Message-ID: <1423325437-32987-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 7.42.2
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libvips/libvips.hash |    2 ++
 package/libvips/libvips.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/libvips/libvips.hash

diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
new file mode 100644
index 0000000..18c1ae8
--- /dev/null
+++ b/package/libvips/libvips.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  45961855e21c8d5f0983d05bb79a6f3c2427dc6eed8e3ac68c0f62759b8612c6  vips-7.42.2.tar.gz
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 1efe21a..d6dddc8 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBVIPS_VERSION_MAJOR = 7.42
-LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).1
+LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).2
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
 LIBVIPS_SITE = http://www.vips.ecs.soton.ac.uk/supported/$(LIBVIPS_VERSION_MAJOR)
 LIBVIPS_LICENSE = LGPLv2.1+
-- 
1.7.1
