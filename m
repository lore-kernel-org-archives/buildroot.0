From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 16:44:40 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump version
Message-ID: <20140929153251.9C9E09D7CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff494d887471b89fa7a4e0e07c8efbab104825e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hash from release announcement.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash |    2 ++
 package/gstreamer1/gstreamer1/gstreamer1.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
new file mode 100644
index 0000000..c5930e6
--- /dev/null
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
+sha256	11f155784d28b85a12b50d2fc8f91c6b75d9ca325cc76aaffba1a58d4c9549c9	gstreamer-1.4.3.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index f0c2e6e..eaad088 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.4.1
+GSTREAMER1_VERSION = 1.4.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
