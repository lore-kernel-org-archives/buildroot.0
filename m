From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:02:35 +0200
Subject: [Buildroot] [git commit] package/python-crossbar: bump to version
 20.4.2
Message-ID: <20200417194859.4B0888EF65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e06579362d9e97ad2e5fbd384abecc4ef21b649b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crossbar/python-crossbar.hash | 4 ++--
 package/python-crossbar/python-crossbar.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 12e4b0232c..486b4d5695 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5  b0ac2a71449988df629d216a90d1f21f  crossbar-20.4.1.tar.gz
-sha256  6bf215348bc6fdce7d41c77e4aa0e023c6a6208291eebc520a3d153f36f601d6  crossbar-20.4.1.tar.gz
+md5  f1756c5a7eac95aa0ff3e307cdd960df  crossbar-20.4.2.tar.gz
+sha256  67a14864850b562c2b5586eca37f39b2eff3d650ba955bace894e6b5d0633dbb  crossbar-20.4.2.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 77565b7068..99ddc67df7 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 20.4.1
+PYTHON_CROSSBAR_VERSION = 20.4.2
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/2c/0c/054ac48881390c83f8bee2a1b50cd5fa6322aa83f589090ced572079b974
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/3f/a2/d8aff4b366b565669236e6bbb09d9f1bbe9162eb542822e89210141dd738
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
