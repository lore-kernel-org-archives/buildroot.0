From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:24:34 +0100
Subject: [Buildroot] [git commit] libestr: bump to version 0.1.10
Message-ID: <20150114192851.1D90680DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e3dc8f9de561e81a2804149cd9bf3a32788e6e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libestr/libestr.hash |    2 ++
 package/libestr/libestr.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libestr/libestr.hash b/package/libestr/libestr.hash
new file mode 100644
index 0000000..e37cbb1
--- /dev/null
+++ b/package/libestr/libestr.hash
@@ -0,0 +1,2 @@
+# From http://libestr.adiscon.com/download/libestr-0-1-10/
+sha256	bd655e126e750edd18544b88eb1568d200a424a0c23f665eb14bbece07ac703c	libestr-0.1.10.tar.gz
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
index d5ff986..e9783d3 100644
--- a/package/libestr/libestr.mk
+++ b/package/libestr/libestr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBESTR_VERSION = 0.1.9
+LIBESTR_VERSION = 0.1.10
 LIBESTR_SITE = http://libestr.adiscon.com/files/download
 LIBESTR_LICENSE = LGPLv2.1+
 LIBESTR_LICENSE_FILES = COPYING
