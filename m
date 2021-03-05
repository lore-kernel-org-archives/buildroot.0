From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 22:29:30 +0100
Subject: [Buildroot] [git commit] package/python-werkzeug: add CPE variables
Message-ID: <20210305212717.1765280DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79d0ffa94e5ddfdb0b4220a07ca2517704ec86bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:palletsprojects:werkzeug is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apalletsprojects%3Awerkzeug

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-werkzeug/python-werkzeug.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 1013f8af80..fe9b87af1d 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -10,5 +10,7 @@ PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/a3332915014
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
+PYTHON_WERKZEUG_CPE_ID_VENDOR = palletsprojects
+PYTHON_WERKZEUG_CPE_ID_PRODUCT = werkzeug
 
 $(eval $(python-package))
