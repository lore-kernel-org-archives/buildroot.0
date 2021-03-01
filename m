From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 20:18:41 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp-session: add CPE
 variables
Message-ID: <20210301185648.24B18813CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b348dd51638e7dfef2ed901d5bb79b083deb607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:aiohttp-session_project:aiohttp-session is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaiohttp-session_project%3Aaiohttp-session

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
