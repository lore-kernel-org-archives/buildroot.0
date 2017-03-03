From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:03:26 +0200
Subject: [Buildroot] [PATCH] python-pyasn: fix legal info
Message-ID: <31f068f667b34559294730ca14e56f19dea4125d.1488517406.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/29c/29ca13a653b2c0cbe449d0b5d795558ce5e4df82/
http://autobuild.buildroot.net/results/5cc/5cc55472682bcb48f732267dd2d9073ce338c294/
http://autobuild.buildroot.net/results/dd9/dd9b087a0e907cbc36f0b870beba375c5fe5b17f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/python-pyasn/python-pyasn.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 20b263076d95..4fc091fb7023 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -7,8 +7,8 @@
 PYTHON_PYASN_VERSION = 1.6.0b1
 PYTHON_PYASN_SOURCE = pyasn-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/31/da/c8338545be0ee7a727c977113e75888e4f1f2b2e10f9284fdfa31dab29bc
-PYTHON_PYASN_LICENSE = BSD-2c
-PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
+PYTHON_PYASN_LICENSE = MIT, BSD-4c (radix tree)
+PYTHON_PYASN_LICENSE_FILES = LICENSE
 PYTHON_PYASN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
-- 
2.11.0
