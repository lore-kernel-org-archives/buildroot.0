From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 19:39:26 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-crossbar: bump to version
 20.4.1
Message-ID: <20200414013926.81137-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-crossbar/python-crossbar.hash | 4 ++--
 package/python-crossbar/python-crossbar.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 1be4c72b76..12e4b0232c 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5  bacb1f25cbf8fcdd0568325ef04a721c  crossbar-20.2.1.tar.gz
-sha256  a63951780fde8c46834c70a637d97f3b2028da637b7a4f793b624532f7a45863  crossbar-20.2.1.tar.gz
+md5  b0ac2a71449988df629d216a90d1f21f  crossbar-20.4.1.tar.gz
+sha256  6bf215348bc6fdce7d41c77e4aa0e023c6a6208291eebc520a3d153f36f601d6  crossbar-20.4.1.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 84d4177daa..77565b7068 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 20.2.1
+PYTHON_CROSSBAR_VERSION = 20.4.1
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/78/f0/82970d84abd532bdea007322b73bfe2d7762194b85155296b76ba48724e9
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/2c/0c/054ac48881390c83f8bee2a1b50cd5fa6322aa83f589090ced572079b974
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
-- 
2.20.1
