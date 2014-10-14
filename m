From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 17:27:45 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 2.8
Message-ID: <20141015125351.9F2D7B2E04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6546080fb168d186c5b2f4484c846ce1991ab4a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.hash |    2 ++
 package/radvd/radvd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
new file mode 100644
index 0000000..3ae4b69
--- /dev/null
+++ b/package/radvd/radvd.hash
@@ -0,0 +1,2 @@
+# From http://www.litech.org/radvd/dist/radvd-2.8.tar.gz.sha256
+sha256	0a1041b2044dafa45882b9fc30badadb7abed76c1a20f6332fecaa53c8440df9	radvd-2.8.tar.xz
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index f99ac6c..e0d4f69 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.7
+RADVD_VERSION = 2.8
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
