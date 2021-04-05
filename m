From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Apr 2021 11:41:57 +0200
Subject: [Buildroot] [git commit] package/python-web2py: add CPE variables
Message-ID: <20210405092115.1AE957F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f684bc46ca1a14d701f019e108e04eea01128ba3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:web2py:web2py is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aweb2py%3Aweb2py

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-web2py/python-web2py.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 07251ba53c..26214a8110 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -8,6 +8,8 @@ PYTHON_WEB2PY_VERSION = 2.20.4
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
+PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
+PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
 PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
 	host-python-pydal host-python-yatl
 
