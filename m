From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 13:43:29 +0100
Subject: [Buildroot] [git commit] grep: bump to version 2.21
Message-ID: <20141201104838.41E6C7FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd71748f0db307dbff669efdb816ab5ee0311432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.hash |    2 ++
 package/grep/grep.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
new file mode 100644
index 0000000..d27a26a
--- /dev/null
+++ b/package/grep/grep.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking signature
+sha256	5244a11c00dee8e7e5e714b9aaa053ac6cbfa27e104abee20d3c778e4bb0e5de	grep-2.21.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 2c2477c..80f6e71 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.20
+GREP_VERSION = 2.21
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
