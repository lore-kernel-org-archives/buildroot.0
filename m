From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:20 +0200
Subject: [Buildroot] [git commit] package/python-twisted: bump version to
	16.4.1
Message-ID: <20161007131552.24FC2822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20468023e0299d9db5efabe910c3a7c1a3507feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 8836a10..c3a6e95 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/Twisted/json, sha256 locally computed.
-md5     8b35a88d5f1a4bfd762a008968fddabf  Twisted-16.2.0.tar.bz2
-sha256  a090e8dc675e97fb20c3bb5f8114ae94169f4e29fd3b3cbede35705fd3cdbd79  Twisted-16.2.0.tar.bz2
+# md5 from https://pypi.python.org/pypi/twisted/json, sha256 locally computed
+md5	c6d09bdd681f538369659111f079c29d  Twisted-16.4.1.tar.bz2
+sha256	1d8d73f006c990744effb35588359fd44d43608649ac0b6b7edc71176e88e816  Twisted-16.4.1.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 3c45d01..7e9e496 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 16.2.0
+PYTHON_TWISTED_VERSION = 16.4.1
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/18/85/eb7af503356e933061bf1220033c3a85bad0dbc5035dfd9a97f1e900dfcb
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/6b/23/8dbe86fc83215015e221fbd861a545c6ec5c9e9cd7514af114d1f64084ab
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
