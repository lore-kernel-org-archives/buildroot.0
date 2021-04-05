From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 18:25:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: add CPE variables
Message-ID: <20210405162504.4153501-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ipython:ipython is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aipython%3Aipython

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ipython/python-ipython.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index f340e9b013..8136353ae2 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -9,6 +9,8 @@ PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
 PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c0/e5/ba19ae58e9bdd80832332873cb4e11a90cf2049df052c1aadeabc2cdadeb
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
+PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
+PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
 PYTHON_IPYTHON_SETUP_TYPE = distutils
 
 $(eval $(python-package))
-- 
2.30.2
