From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 22:03:13 +0200
Subject: [Buildroot] [git commit] atk: bump to version 2.14
Message-ID: <20141002200404.E641C9D32C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=625d0bb4003ec25e6022754a4fb4fb3177a03365
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atk/atk.hash |    2 ++
 package/atk/atk.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
new file mode 100644
index 0000000..fe35585
--- /dev/null
+++ b/package/atk/atk.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.14/atk-2.14.0.sha256sum
+sha256	2875cc0b32bfb173c066c22a337f79793e0c99d2cc5e81c4dac0d5a523b8fbad	atk-2.14.0.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 46a097d..4971cda 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.12
+ATK_VERSION_MAJOR = 2.14
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
