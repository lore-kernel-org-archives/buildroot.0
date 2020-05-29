From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:08:40 +0200
Subject: [Buildroot] [git commit] package/python-modbus-tk: bump to version
 1.1.1
Message-ID: <20200602200122.6DA03812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9789f56ee3221c181b10abccd23e74969783b479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

5732f86 1.1.1
d8e9b32 pep8
4795bc7 Add Jackson Matheson to contributors
26db934 Merge branch 'master' of https://github.com/ljean/modbus-tk
837a12b Merge pull request #125 from jacksonmatheson/master
07b06f8 Fixed READ_WRITE_MULTIPLE_REGISTERS, added write_starting_address_FC23

Also update hash file formatting (2 spaces).

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-modbus-tk/python-modbus-tk.hash | 8 ++++----
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index fc9899366b..c4fde683c3 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/modbus-tk/json
-md5	65e0a1b12bd6650bdc4f7d823669ab6f  modbus_tk-1.1.0.tar.gz
-sha256	8e31db8f148871006b569931c31ef17692363acf90a0d0bafd2d868f51b70772  modbus_tk-1.1.0.tar.gz
+md5  e52d5de22cc9d97f2c1086d9b11f0f1e  modbus_tk-1.1.1.tar.gz
+sha256  c6dd004bc6bbff6d9fa93e61654c30a26c817c6632036c656383c9ecadca6639  modbus_tk-1.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
-sha256	aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
+sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
+sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index a2a0cd0e6c..37927575ae 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.0
+PYTHON_MODBUS_TK_VERSION = 1.1.1
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/49/aa/97e40e2da1b9904a78466b4d759091ef015f6946a423f1675bfcab7950c8
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/63/2e/991c8965fd45db4c38fefe1fa70356825e847e1bbb1f14e127aa2b4d37aa
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
