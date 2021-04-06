From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 13:01:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-pillow:
 add CPE variables
Message-ID: <20210406104423.1818F82A8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d83594378c44f31be6373ef4e22088bcec0c5bab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python:pillow is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Apillow

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51cb6cfad422beef2279cac72870791d42ef8b1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 60a0bb3e1b..f71fa156e2 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -9,6 +9,8 @@ PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/2b/06/93bf1626ef368
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
+PYTHON_PILLOW_CPE_ID_VENDOR = python
+PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
 
