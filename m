From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 10:00:13 -0000
Subject: [Buildroot] [git commit] package/python-lxml: bump to version 4.3.1
Message-ID: <20190305095735.1CBE58E950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44b771b06b178a35dd44192a45600374def0e1f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iso-schematron.rng change: update RNG schema to 2016 specification.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lxml/python-lxml.hash | 4 ++--
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 6558f107e3..19c30f3ac6 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  7035d9361f3ceec9ccc1dd3482094d1174580e7e1bf6870b77ea758f7cad15d2  lxml-4.2.6.tar.gz
+sha256  da5e7e941d6e71c9c9a717c93725cda0708c2474f532e3680ac5e39ec57d224d  lxml-4.3.1.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
-sha256  705bdfece6dbb87879d9ec40a8c9530651aefb98ae387da9134584464742d539  src/lxml/isoschematron/resources/rng/iso-schematron.rng
+sha256  56c5b13f28b78958890c36e3249c34c169041e42ebcfdce8080f3324ba2bf4de  src/lxml/isoschematron/resources/rng/iso-schematron.rng
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 1b46670ffd..29c77dd351 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.2.6
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/b0/06/37437e348cd296c56a8bac0396007960abb2bcdaf77e8a3bde52bb68e550
+PYTHON_LXML_VERSION = 4.3.1
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/0f/bd/bb1464d1f363dbd805862c8a1ea258b9a4f4d2049c376d1c4790b6545691
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
