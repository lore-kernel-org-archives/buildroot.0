From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 17:40:51 +0100
Subject: [Buildroot] [git commit] libvips: bump version to 7.42.2
Message-ID: <20150207164213.0A5A080446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4e4842f24670378ae7aaca9aa2210514f89d7e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 7.42.2
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvips/libvips.hash |    2 ++
 package/libvips/libvips.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
