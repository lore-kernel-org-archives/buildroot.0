From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:14:45 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/python-pyyaml:
 security bump to 4.2b4
Message-ID: <20190124161401.69357890FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2d0f6bff89a4886a7d3081d4b7a8a7b685922e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2017-18342: In PyYAML before 4.1, the yaml.load() API
could execute arbitrary code.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1cf071726d3637458cfb0f3f546c69377f720de0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.hash | 4 ++--
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index 47a379ce6a..256742feb6 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.python.org/pypi/pyyaml/json
-md5 b78b96636d68ac581c0e2f38158c224f PyYAML-3.13.tar.gz
-sha256 3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf PyYAML-3.13.tar.gz
+md5 a842bc7391e145bbe4e7fd0d32da1132 PyYAML-4.2b4.tar.gz
+sha256 3c17fb92c8ba2f525e4b5f7941d850e7a48c3a59b32d331e2502a3cdc6648e76 PyYAML-4.2b4.tar.gz
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index cbf8df7b2d..95f0f0bb9e 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 3.13
+PYTHON_PYYAML_VERSION = 4.2b4
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/a8/c6/a8d1555e795dbd0375c3c93b576ca13bbf139db51ea604afa19a2c35fc03
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
