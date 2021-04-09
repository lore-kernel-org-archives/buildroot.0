From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 00:24:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-httplib2: add CPE variables
In-Reply-To: <20210409222445.3865584-1-fontaine.fabrice@gmail.com>
References: <20210409222445.3865584-1-fontaine.fabrice@gmail.com>
Message-ID: <20210409222445.3865584-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:httplib2_project:httplib2 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahttplib2_project%3Ahttplib2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-httplib2/python-httplib2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 7b9b400241..a259c33c73 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -10,5 +10,7 @@ PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/ed/cd/533a1e9e046
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
+PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
+PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
-- 
2.30.2
