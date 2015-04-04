From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 21:05:11 +0200
Subject: [Buildroot] [git commit] xerces: bump version, use .tar.xz,
	add hash file
Message-ID: <20150404191543.8FB378180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86f5fb8c742fdef5d465110069463582f33e699a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the version of xerces to 3.1.2, changes tarball to
.tar.xz, and adds a hash file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/xerces.hash |    2 ++
 package/xerces/xerces.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
new file mode 100644
index 0000000..6f4c267
--- /dev/null
+++ b/package/xerces/xerces.hash
@@ -0,0 +1,2 @@
+# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.2.tar.xz.sha256
+sha256 a847529ab6125f36039f54fa61f3d5043791accf7da2f43917cd2b49deb768f1 xerces-c-3.1.2.tar.xz
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 59b8d8a..20426b6 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.1.1
-XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
+XERCES_VERSION = 3.1.2
+XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
