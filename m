From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:20 +0200
Subject: [Buildroot] [git commit] package/python-werkzeug: bump version to
	0.11.11
Message-ID: <20161007131552.3D11E822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c36047128895b0fb8746664dddae0fd40b47fe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index e2afd14..3f23352 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=780967186f9157e88f2bfbfa6f07a893, sha256 locally computed
-md5	780967186f9157e88f2bfbfa6f07a893  Werkzeug-0.11.10.tar.gz
-sha256	cc64dafbacc716cdd42503cf6c44cb5a35576443d82f29f6829e5c49264aeeee  Werkzeug-0.11.10.tar.gz
+# md5 from https://pypi.python.org/pypi/werkzeug/json, sha256 locally computed
+md5	1d34afa1f19abcef4c0da51ebc2c4ea7  Werkzeug-0.11.11.tar.gz
+sha256	e72c46bc14405cba7a26bd2ce28df734471bc9016bc8b4cb69466c2c14c2f7e5  Werkzeug-0.11.11.tar.gz
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index c0af65c..072937f 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.11.10
+PYTHON_WERKZEUG_VERSION = 0.11.11
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/b7/7f/44d3cfe5a12ba002b253f6985a4477edfa66da53787a2a838a40f6415263
+PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/43/2e/d822b4a4216804519ace92e0368dcfc4b0b2887462d852fdd476b253ecc9
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3c
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
