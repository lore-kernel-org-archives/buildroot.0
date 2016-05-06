From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:29:06 +0200
Subject: [Buildroot] [git commit] python-twisted: bump to version 16.1.1
Message-ID: <20160506132916.70E418180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b607f0cc6a16c95cb38bf97d3737db97fc1312cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream md5 checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-twisted/python-twisted.hash | 5 +++--
 package/python-twisted/python-twisted.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 9a9436f..275cea8 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  a8046804a0dfae090234bbb90fc560a6cc11a208b3d048b55244c79c1945c17f  Twisted-15.5.0.tar.bz2
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=266a085f5ce3fbc060818bd00bd6a888, sha256 locally computed
+md5     266a085f5ce3fbc060818bd00bd6a888 Twisted-16.1.1.tar.bz2
+sha256  fe7d001d9a803ed26cd0fd2f69fa4212ff025f3af6ef1a559d905fe551ab04e9  Twisted-16.1.1.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 29fd510..e98e03f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 15.5.0
+PYTHON_TWISTED_VERSION = 16.1.1
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
 PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted
 PYTHON_TWISTED_SETUP_TYPE = setuptools
