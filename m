From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 08:00:32 +0100
Subject: [Buildroot] [git commit] alsa-lib: bump to version 1.0.29
Message-ID: <20150303070134.38818801F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5aaa8ea153c597ec2a2a5e6f5e4190e55f429654
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash |    2 ++
 package/alsa-lib/alsa-lib.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
new file mode 100644
index 0000000..3e132c8
--- /dev/null
+++ b/package/alsa-lib/alsa-lib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0	alsa-lib-1.0.29.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index c67258f..3115433 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.0.28
+ALSA_LIB_VERSION = 1.0.29
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
