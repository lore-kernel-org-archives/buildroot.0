From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:40:00 +0100
Subject: [Buildroot] [git commit] python-pyasn: fix legal info
Message-ID: <20170303074059.BC43481D4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aca82a056b04f1bc1d2578e414d8a8d1eaf66207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/29c/29ca13a653b2c0cbe449d0b5d795558ce5e4df82/
http://autobuild.buildroot.net/results/5cc/5cc55472682bcb48f732267dd2d9073ce338c294/
http://autobuild.buildroot.net/results/dd9/dd9b087a0e907cbc36f0b870beba375c5fe5b17f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/python-pyasn.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 20b2630..4fc091f 100644
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
