From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:13:31 +0200
Subject: [Buildroot] [git commit] file: bump to version 5.20
Message-ID: <20141012072420.762E0B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5734914f4b5421b2e204d2c49100914bfbf2408b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.hash |    2 ++
 package/file/file.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
new file mode 100644
index 0000000..1043d74
--- /dev/null
+++ b/package/file/file.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5bc36bfbb83a009da25a7174848f1bc5824be03192a8fdce7f83dc897ed2d247	file-5.20.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 5df024f..603e510 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.19
+FILE_VERSION = 5.20
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
