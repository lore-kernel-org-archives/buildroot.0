From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 Apr 2020 12:14:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-wcwidth: bump to version
 0.1.9
Message-ID: <20200423101459.913674-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-wcwidth/python-wcwidth.hash | 6 +++---
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index 07ce8508ac..ed1d2cd61f 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/wcwidth/json
-md5	b3b6a0a08f0c8a34d1de8cf44150a4ad	wcwidth-0.1.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/wcwidth/json
+md5  b32584cd6084b4a8c81df13a2a6b4351  wcwidth-0.1.9.tar.gz
+sha256  ee73862862a156bf77ff92b09034fc4825dd3af9cf81bc5b360668d425f3c5f1  wcwidth-0.1.9.tar.gz
 # Locally computed
-sha256  3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e  wcwidth-0.1.7.tar.gz
 sha256  0eddcc52cd3ef5d30798b8d43a14d3f0f1dcf0a6e4c1d0f2e177c44ce85bb69c  LICENSE.txt
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 2dd392a595..ccbd0e99ca 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.1.7
+PYTHON_WCWIDTH_VERSION = 0.1.9
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://pypi.python.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495
+PYTHON_WCWIDTH_SITE = https://pypi.python.org/packages/25/9d/0acbed6e4a4be4fc99148f275488580968f44ddb5e69b8ceb53fc9df55a0
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
