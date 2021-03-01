From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Mar 2021 18:27:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/python3: add CPE variables
Message-ID: <20210301172727.205605-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:python is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Apython

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python3/python3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 63d6c3f535..def34f46ad 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -10,6 +10,8 @@ PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
 PYTHON3_LICENSE_FILES = LICENSE
+PYTHON3_CPE_ID_VENDOR = python
+PYTHON3_CPE_ID_PRODUCT = python
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
-- 
2.30.0
