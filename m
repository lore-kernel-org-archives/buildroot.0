From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 13:34:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: add CPE variables
Message-ID: <20210515113456.2368103-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tqdm_project:tqdm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atqdm_project%3Atqdm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-tqdm/python-tqdm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 4ff4696e65..5ceddde14c 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -10,5 +10,7 @@ PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/4c/45/830c5c4bfaba60e
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
+PYTHON_TQDM_CPE_ID_VENDOR = tqdm_project
+PYTHON_TQDM_CPE_ID_PRODUCT = tqdm
 
 $(eval $(python-package))
-- 
2.30.2
