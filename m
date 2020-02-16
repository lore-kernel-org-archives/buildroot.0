From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:23:35 +0100
Subject: [Buildroot] [git commit] package/python-pyyaml: bump to version 5.3
Message-ID: <20200216141641.43C598E1F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcca4ef19d0e4b6d6c690505913e83f2f112ad74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.hash | 4 ++--
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index a5cbf82986..e0d182bcbb 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5	20f87ab421b0271dbf371dc5c1cddb5c  PyYAML-5.1.2.tar.gz
-sha256	01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4  PyYAML-5.1.2.tar.gz
+md5	adbb0d336b509d6472d3b095a0f1cf30  PyYAML-5.3.tar.gz
+sha256	e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615  PyYAML-5.3.tar.gz
 # Locally computed sha256 checksums
 sha256	a2adb9c959b797494a0ef80bdf60e22db2749ee3e0c0908556e3eb548f967c56  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 165a938f11..5d9246d37c 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 5.1.2
+PYTHON_PYYAML_VERSION = 5.3
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/e3/e8/b3212641ee2718d556df0f23f78de8303f068fe29cdaa7a91018849582fe
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/3d/d9/ea9816aea31beeadccd03f1f8b625ecf8f645bd66744484d162d84803ce5
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
