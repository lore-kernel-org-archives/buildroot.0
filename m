From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 22:40:38 +0200
Subject: [Buildroot] [PATCH 3/5] package/python-requests-oauthlib: bump
 version to 1.2.0
In-Reply-To: <20190803204040.341-1-bernd.kuhls@t-online.de>
References: <20190803204040.341-1-bernd.kuhls@t-online.de>
Message-ID: <20190803204040.341-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../python-requests-oauthlib/python-requests-oauthlib.hash    | 4 ++--
 package/python-requests-oauthlib/python-requests-oauthlib.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
index 733d293386..784ad8e692 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.hash
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-oauthlib/json
-md5	e867404084b688dbfb879b9ac9ac040a  requests-oauthlib-1.0.0.tar.gz
-sha256	8886bfec5ad7afb391ed5443b1f697c6f4ae98d0e5620839d8b4499c032ada3f  requests-oauthlib-1.0.0.tar.gz
+md5	c32a54ce04123480132960a290d50792  requests-oauthlib-1.2.0.tar.gz
+sha256	bd6533330e8748e94bf0b214775fed487d309b8b8fe823dc45641ebcd9a32f57  requests-oauthlib-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256	ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
index a8761b18b1..41dca1abdd 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.mk
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.0.0
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.2.0
 PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
-PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/95/be/072464f05b70e4142cb37151e215a2037b08b1400f8a56f2538b76ca6205
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/de/a2/f55312dfe2f7a344d0d4044fdfae12ac8a24169dc668bd55f72b27090c32
 PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
 PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.20.1
