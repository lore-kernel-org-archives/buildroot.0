From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:16:20 +0200
Subject: [Buildroot] [git commit] package/python-lxml: bump to version 4.3.4
Message-ID: <20190611202321.CC85C8F5BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d122c688990904d7ef10fb5f142b4645cf8b6098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 9696d8534d..f37c673807 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4a03dd682f8e35a10234904e0b9508d705ff98cf962c5851ed052e9340df3d90  lxml-4.3.3.tar.gz
+sha256  3ce1c49d4b4a7bc75fb12acb3a6247bb7a91fe420542e6d671ba9187d12a12c2  lxml-4.3.4.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index e80d056653..3b867d46a4 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.3.3
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/7d/29/174d70f303016c58bd790c6c86e6e86a9d18239fac314d55a9b7be501943
+PYTHON_LXML_VERSION = 4.3.4
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/da/b5/d3e0d22649c63e92cb0902847da9ae155c1e801178ab5d272308f35f726e
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
