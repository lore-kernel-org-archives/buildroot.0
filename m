From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 13:33:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: add CPE variables
Message-ID: <20210405113328.3569673-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:networkx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Anetworkx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-networkx/python-networkx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 2efc53d628..8ebbc84bde 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -9,6 +9,8 @@ PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
 PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/bf/63/7b579dd3b1c49ce6b7fd8f6f864038f255201410905dd183cf7f4a3845cf
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
+PYTHON_NETWORKX_CPE_ID_VENDOR = python
+PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
 HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python3-decorator
 HOST_PYTHON_NETWORKX_NEEDS_HOST_PYTHON = python3
-- 
2.30.2
