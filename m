From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:33:42 +0200
Subject: [Buildroot] [git commit] package/python-py: add CPE variables
Message-ID: <20210406071627.E81E78D3EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24729c897192f987847035b18cbc5aebe3c6d16d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pytest:py is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apytest%3Apy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-py/python-py.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index c753183933..2e9d18ab1a 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -11,5 +11,7 @@ PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
 PYTHON_PY_LICENSE_FILES = LICENSE
+PYTHON_PY_CPE_ID_VENDOR = pytest
+PYTHON_PY_CPE_ID_PRODUCT = py
 
 $(eval $(python-package))
