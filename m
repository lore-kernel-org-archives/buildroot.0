From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 23:04:41 +0200
Subject: [Buildroot] [git commit] python-certifi: bump to version 2017.4.17
Message-ID: <20170721210346.4C0637F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=482b4229abbb7dacbd172b9082f750598a5197d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index ab0e373..7aef735 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/certifi/json, sha256 locally computed
-md5 b72521a8badff5e89a8eabea586d79ab certifi-2017.1.23.tar.gz
-sha256 81877fb7ac126e9215dfb15bfef7115fdc30e798e0013065158eed0707fd99ce certifi-2017.1.23.tar.gz
+md5	db40445044feda1437ce3ccd5fc28a57  certifi-2017.4.17.tar.gz
+sha256	f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a  certifi-2017.4.17.tar.gz
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 3f83194..207d4f9 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2017.1.23
+PYTHON_CERTIFI_VERSION = 2017.4.17
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/b6/fa/ca682d5ace0700008d246664e50db8d095d23750bb212c0086305450c276
+PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/dd/0e/1e3b58c861d40a9ca2d7ea4ccf47271d4456ae4294c5998ad817bd1b4396
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
