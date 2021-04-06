From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:44:13 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-paramiko:
 add CPE variables
Message-ID: <20210406072100.512658BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=836935b19890f273be0bdccb9fb93328c02e5e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:paramiko:paramiko is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aparamiko%3Aparamiko

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9ca20e1efc5ef9f8dbf3ad778deaadab441c9eea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-paramiko/python-paramiko.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index c9e144c96e..6dc473d34e 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -10,5 +10,7 @@ PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/ac/15/4351003352e
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
+PYTHON_PARAMIKO_CPE_ID_VENDOR = paramiko
+PYTHON_PARAMIKO_CPE_ID_PRODUCT = paramiko
 
 $(eval $(python-package))
