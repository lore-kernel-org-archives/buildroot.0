From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 22:40:40 +0200
Subject: [Buildroot] [PATCH 5/5] package/python-mwclient: bump version to
 0.10.0
In-Reply-To: <20190803204040.341-1-bernd.kuhls@t-online.de>
References: <20190803204040.341-1-bernd.kuhls@t-online.de>
Message-ID: <20190803204040.341-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-mwclient/python-mwclient.hash | 6 +++---
 package/python-mwclient/python-mwclient.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index fccfbcdcb6..a61dfd6963 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mwclient/json
-md5	994337c4153d86345f2dfdf74e53b546  mwclient-0.9.2.tar.gz
-sha256	60ed0b13fdef8cb2ce4dde79bc92dd729de093e86f188225b4bcd73e32d75282  mwclient-0.9.2.tar.gz
+md5	c1b9f69d0eb71a031c1254b1ed16f678  mwclient-0.10.0.tar.gz
+sha256	c3f1598a5f75fb80e9b8373f6574042208358aed81470fc2178a8ae7474069af  mwclient-0.10.0.tar.gz
 # Locally computed
-sha256	d29eaa80939b6d8fc3ab458bab90f4af879fa9e0430ed7e0fb2b94752e7eb33f  mwclient/__init__.py
+sha256 0e713ce8e3e490bdc15ac1e59feba3009daef3fff10dd80d8baa6e5f9a294f32  LICENSE.md
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 0e20dd6261..de66a42740 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.9.2
+PYTHON_MWCLIENT_VERSION = 0.10.0
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/f8/5a/9a5cf29e256c5720b9dc3b60586be6557e5f8bbf313d90bf75b0d967f0af
+PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/c1/ec/6206a7b3834572b3c1082f58dc960f4e49543395aa55955b598c29c9f8ad
 PYTHON_MWCLIENT_LICENSE = MIT
-PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
+PYTHON_MWCLIENT_LICENSE_FILES = LICENSE.md
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.20.1
