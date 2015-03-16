From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2015 09:36:35 +0100
Subject: [Buildroot] [git commit] ofono: bump to version 1.16
Message-ID: <20150316083709.D6C1F804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=544eb35fc5247215bac1204d1f633107a8142c7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: verify pgp signature and add comment to .hash]
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/ofono.hash |    2 ++
 package/ofono/ofono.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
new file mode 100644
index 0000000..ddf9bf0
--- /dev/null
+++ b/package/ofono/ofono.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07  ofono-1.16.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index e964376..caf6aab 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.14
+OFONO_VERSION = 1.16
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
