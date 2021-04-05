From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 12:12:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/scapy: add CPE variables
Message-ID: <20210405101222.3565607-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:scapy:scapy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ascapy%3Ascapy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-scapy/python-scapy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 3d9a4e1914..3083a84412 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -10,5 +10,7 @@ PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/c6/8f/438d4d0bab4c8e
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
+PYTHON_SCAPY_CPE_ID_VENDOR = scapy
+PYTHON_SCAPY_CPE_ID_PRODUCT = scapy
 
 $(eval $(python-package))
-- 
2.30.2
