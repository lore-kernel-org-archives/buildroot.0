From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 13:02:11 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-aiohttp:
 add CPE variables
Message-ID: <20210406104423.3822B82A8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f3aadc196744b3b5dae51913c1f7399dcfbb4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:aiohttp_project:aiohttp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaiohttp_project%3Aaiohttp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e53f3fc638aeb2f1247c485ac78fcc46fce7f11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiohttp/python-aiohttp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index f1e755c023..e878ac1a55 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -10,5 +10,7 @@ PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/7a/95/eb60aaad7943
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
+PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp_project
+PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
 
 $(eval $(python-package))
