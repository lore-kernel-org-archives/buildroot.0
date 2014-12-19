From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Dec 2014 00:37:06 +0100
Subject: [Buildroot] [git commit] orc: bump version
Message-ID: <20141219233726.67EEE8008A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46152abcf2616fd5cfd79c2349d734215bbd9708
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.hash |    2 ++
 package/orc/orc.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
new file mode 100644
index 0000000..ce720cb
--- /dev/null
+++ b/package/orc/orc.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050855.html
+sha256	767eaebce2941737b43368225ec54598b3055ca78b4dc50c4092f5fcdc0bdfe7  orc-0.4.23.tar.xz
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 6637cbb..0d9e78c 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.22
+ORC_VERSION = 0.4.23
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2c, BSD-3c
