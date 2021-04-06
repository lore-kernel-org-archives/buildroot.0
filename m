From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:30:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/scapy: add CPE
 variables
Message-ID: <20210406090708.3C82782A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e87a4210930f8ec9aada81824574b0e0b976179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:scapy:scapy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ascapy%3Ascapy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 241ab7cb3f42375ed9f75fb1cb165bd4f4947f0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
