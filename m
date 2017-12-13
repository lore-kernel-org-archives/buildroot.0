From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:43 +0100
Subject: [Buildroot] [git commit] package/python-pyasn-modules: switch SITE
 to https
Message-ID: <20171213070253.95E237FB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adbd0c44dec25d0645f2cdb40af71a1f8a8f02aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn-modules/python-pyasn-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn-modules/python-pyasn-modules.mk b/package/python-pyasn-modules/python-pyasn-modules.mk
index 4e8f9b9..b5e853a 100644
--- a/package/python-pyasn-modules/python-pyasn-modules.mk
+++ b/package/python-pyasn-modules/python-pyasn-modules.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASN_MODULES_VERSION = 0.0.8
 PYTHON_PYASN_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN_MODULES_VERSION).tar.gz
-PYTHON_PYASN_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
+PYTHON_PYASN_MODULES_SITE = https://pypi.python.org/packages/source/p/pyasn1-modules
 PYTHON_PYASN_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN_MODULES_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_MODULES_SETUP_TYPE = setuptools
