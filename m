From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sat, 12 Dec 2020 16:24:50 +0100
Subject: [Buildroot] [PATCH] package/python-iniconfig: bump to version 1.1.1
Message-ID: <20201212152450.53827-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 708c0553ac..b2469db99b 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  464179a74789d033b170101f6aa38c2a  iniconfig-1.0.1.tar.gz
-sha256  e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69  iniconfig-1.0.1.tar.gz
+md5  0b7f3be87481211c183eae095bcea6f1  iniconfig-1.1.1.tar.gz
+sha256  bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32  iniconfig-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 57f31c4194..5c31c69957 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 1.0.1
+PYTHON_INICONFIG_VERSION = 1.1.1
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/aa/6e/60dafce419de21f2f3f29319114808cac9f49b6c15117a419737a4ce3813
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/23/a2/97899f6bd0e873fed3a7e67ae8d3a08b21799430fb4da15cfedf10d6e2c2
 PYTHON_INICONFIG_SETUP_TYPE = setuptools
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
-- 
2.29.2
