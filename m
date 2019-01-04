From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Jan 2019 09:00:50 +0200
Subject: [Buildroot] [PATCH 1/1] python-lxml: bump to version 4.2.6
Message-ID: <20190104070050.1359-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update site to files.pythonhosted.org.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 610c0d6db4..6558f107e3 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  36720698c29e7a9626a0dc802ef8885f8f0239bfd1689628ecd459a061f2807f  lxml-4.2.5.tgz
+sha256  7035d9361f3ceec9ccc1dd3482094d1174580e7e1bf6870b77ea758f7cad15d2  lxml-4.2.6.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 61f81e6363..1b46670ffd 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.2.5
-PYTHON_LXML_SITE = http://lxml.de/files
-PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
+PYTHON_LXML_VERSION = 4.2.6
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/b0/06/37437e348cd296c56a8bac0396007960abb2bcdaf77e8a3bde52bb68e550
+PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
 PYTHON_LXML_LICENSE = BSD-3-Clause, Others
-- 
2.19.1
