From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:45:43 +0100
Subject: [Buildroot] [git commit] package/qhull: bump version to 7.2.0,
	add hash
Message-ID: <20160201224710.ACCCC7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fcababa14e19cec34e1e2bc93099c711a5eb19c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated _SITE after closure of gitorious.org.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qhull/qhull.hash | 4 ++++
 package/qhull/qhull.mk   | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/qhull/qhull.hash b/package/qhull/qhull.hash
new file mode 100644
index 0000000..4f059f2
--- /dev/null
+++ b/package/qhull/qhull.hash
@@ -0,0 +1,4 @@
+# From http://www.qhull.org/download/qhull-2015.2.md5sum
+md5	e6270733a826a6a7c32b796e005ec3dc	qhull-2015-src-7.2.0.tgz
+# Locally computed
+sha256	78b010925c3b577adc3d58278787d7df08f7c8fb02c3490e375eab91bb58a436	qhull-2015-src-7.2.0.tgz
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index 6992d71..8ea38f0 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-QHULL_VERSION = 60d55819729d7b49391dde0271e15a56c70992b9
-QHULL_SITE = git://gitorious.org/qhull/qhull.git
+QHULL_VERSION = 7.2.0
+QHULL_SITE = http://www.qhull.org/download
+QHULL_SOURCE = qhull-2015-src-$(QHULL_VERSION).tgz
 QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
