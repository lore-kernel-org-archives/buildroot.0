From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:21:58 +0100
Subject: [Buildroot] [git commit branch/next] package/python-lxml: bump to
 version 4.5.0
Message-ID: <20200227100041.650428EC46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36074cd3de87cc092b4d9a53e278c38dba6ec30b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index eb7acbaabd..593a5e1c56 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c81cb40bff373ab7a7446d6bbca0190bccc5be3448b47b51d729e37799bb5692  lxml-4.4.1.tar.gz
+sha256  8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60  lxml-4.5.0.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 0eb837080a..cfb87bb6fd 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.4.1
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/c4/43/3f1e7d742e2a7925be180b6af5e0f67d38de2f37560365ac1a0b9a04c015
+PYTHON_LXML_VERSION = 4.5.0
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/39/2b/0a66d5436f237aff76b91e68b4d8c041d145ad0a2cdeefe2c42f76ba2857
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
