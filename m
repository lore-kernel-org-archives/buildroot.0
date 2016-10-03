From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:10:50 +0200
Subject: [Buildroot] [git commit] python-networkmanager: bump to version
	1.2.1
Message-ID: <20161003211237.B2EFF8218D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=693f71bb3029d4b8f3b1b6e1c2847c9a715c1cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-networkmanager/python-networkmanager.hash | 6 +++---
 package/python-networkmanager/python-networkmanager.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 00d31d0..cbd6feb 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=d7f0337b8e58c193c574ceae984cc65f, sha256 locally computed
-md5	d7f0337b8e58c193c574ceae984cc65f  python-networkmanager-1.0.1.tar.gz
-sha256	6eb4073a0d6572fe0bba8cbfe8423f6a8a51c4504a33e0eb4f1b1eadf54c4cee  python-networkmanager-1.0.1.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=97c84c19b84b1124903a06379b107f77, sha256 locally computed
+md5	97c84c19b84b1124903a06379b107f77  python-networkmanager-1.2.1.tar.gz
+sha256	7107c07383f8077cfac33fdbb3c4cda4de40be20a6b20d30840055eb519a0e89  python-networkmanager-1.2.1.tar.gz
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index 04a2702..0a8c442 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 1.0.1
-PYTHON_NETWORKMANAGER_SITE = http://pypi.python.org/packages/source/p/python-networkmanager
+PYTHON_NETWORKMANAGER_VERSION = 1.2.1
+PYTHON_NETWORKMANAGER_SOURCE = python-networkmanager-$(PYTHON_NETWORKMANAGER_VERSION).tar.gz
+PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/e7/b1/09993250ceea9e03bc65fbabcd5286540200292c011b22237b2963c11471
 PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
 PYTHON_NETWORKMANAGER_LICENSE = GPLv3+
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
