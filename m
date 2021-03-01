From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Mar 2021 18:22:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: add CPE
 variables
Message-ID: <20210301172203.205169-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:aiohttp-session_project:aiohttp-session is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaiohttp-session_project%3Aaiohttp-session

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-aiohttp-session/python-aiohttp-session.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 8fcd8e21b9..fa724fdb86 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -10,5 +10,7 @@ PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/f8/fe/53df
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
+PYTHON_AIOHTTP_SESSION_CPE_ID_VENDOR = aiohttp-session_project
+PYTHON_AIOHTTP_SESSION_CPE_ID_PRODUCT = aiohttp-session
 
 $(eval $(python-package))
-- 
2.30.0
