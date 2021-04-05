From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:13:57 +0200
Subject: [Buildroot] [git commit] package/python-bsdiff4: add CPE variables
Message-ID: <20210405160039.08BB58D3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09bd087911b81d41e89841c0c82684012f1d6478
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pypi:bsdiff4 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apypi%3Absdiff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bsdiff4/python-bsdiff4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 7bc607b2d6..3b789ac9b4 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -9,6 +9,8 @@ PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
 PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9b/ca/06cd939630ca78125c36489f92b52918980cbcfee2dcc0969411eb5ae8a8
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
+PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
+PYTHON_BSDIFF4_CPE_ID_PRODUCT = bsdiff4
 PYTHON_BSDIFF4_SETUP_TYPE = distutils
 
 $(eval $(python-package))
