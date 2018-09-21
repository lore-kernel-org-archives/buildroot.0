From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 21 Sep 2018 12:59:48 +0300
Subject: [Buildroot] [PATCH 1/1] python-lxml: bump to version 4.2.5
Message-ID: <20180921095948.964-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hashes for license files.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-lxml/python-lxml.hash | 6 +++++-
 package/python-lxml/python-lxml.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 9b75a26280..610c0d6db4 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,6 @@
 # Locally computed
-sha256  e2afbe403090f5893e254958d02875e0732975e73c4c0cdd33c1f009a61963ca  lxml-4.2.4.tgz
+sha256  36720698c29e7a9626a0dc802ef8885f8f0239bfd1689628ecd459a061f2807f  lxml-4.2.5.tgz
+sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
+sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
+sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
+sha256  705bdfece6dbb87879d9ec40a8c9530651aefb98ae387da9134584464742d539  src/lxml/isoschematron/resources/rng/iso-schematron.rng
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 80c04c0055..61f81e6363 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.2.4
+PYTHON_LXML_VERSION = 4.2.5
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
-- 
2.17.1
