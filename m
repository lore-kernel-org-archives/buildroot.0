From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Jan 2021 20:25:45 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-mwclient: bump version to
 0.10.1
Message-ID: <20210101192547.6934-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-mwclient/python-mwclient.hash | 6 +++---
 package/python-mwclient/python-mwclient.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index a61dfd6963..1baa9e9db9 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mwclient/json
-md5	c1b9f69d0eb71a031c1254b1ed16f678  mwclient-0.10.0.tar.gz
-sha256	c3f1598a5f75fb80e9b8373f6574042208358aed81470fc2178a8ae7474069af  mwclient-0.10.0.tar.gz
+md5  148bd36bfaaf591bd9c0076cbf1ed888  mwclient-0.10.1.tar.gz
+sha256  79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139  mwclient-0.10.1.tar.gz
 # Locally computed
-sha256 0e713ce8e3e490bdc15ac1e59feba3009daef3fff10dd80d8baa6e5f9a294f32  LICENSE.md
+sha256  0e713ce8e3e490bdc15ac1e59feba3009daef3fff10dd80d8baa6e5f9a294f32  LICENSE.md
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index de66a42740..07aa877ed9 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.10.0
+PYTHON_MWCLIENT_VERSION = 0.10.1
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/c1/ec/6206a7b3834572b3c1082f58dc960f4e49543395aa55955b598c29c9f8ad
+PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = LICENSE.md
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
-- 
2.29.2
