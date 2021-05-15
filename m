From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:20:48 +0200
Subject: [Buildroot] [git commit] package/python-autobahn: add CPE variables
Message-ID: <20210515115245.1114086B15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28b19ccb487316353e01ce4248978d5ef3aade66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:crossbar:autobahn is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acrossbar%3Aautobahn

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-autobahn/python-autobahn.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 37b3d33534..81e2b7a4ca 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -9,6 +9,8 @@ PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
 PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/cb/16/38d27874ef827974f44acb6dd64a92a9248b624734c0e84b91083c2d9350
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
+PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
+PYTHON_AUTOBAHN_CPE_ID_PRODUCT = autobahn
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
