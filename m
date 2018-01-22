From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 22 Jan 2018 16:33:29 +0100
Subject: [Buildroot] [PATCH] python-certifi: bump to version 2018.1.18
Message-ID: <1516635209-967-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-certifi/python-certifi.hash | 5 +++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 7aef735..e3e2f07 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/certifi/json, sha256 locally computed
-md5	db40445044feda1437ce3ccd5fc28a57  certifi-2017.4.17.tar.gz
-sha256	f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a  certifi-2017.4.17.tar.gz
+md5	068fd5c3c690ae47504b3e0bf4e56c4c  certifi-2018.1.18.tar.gz
+sha256	edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d  certifi-2018.1.18.tar.gz
+sha256	6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 207d4f9..084893f 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2017.4.17
+PYTHON_CERTIFI_VERSION = 2018.1.18
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/dd/0e/1e3b58c861d40a9ca2d7ea4ccf47271d4456ae4294c5998ad817bd1b4396
+PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.1.4
