From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Jan 2021 20:41:12 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-requests-oauthlib: bump
 version to 1.3.0
In-Reply-To: <20210101194113.10929-1-bernd.kuhls@t-online.de>
References: <20210101194113.10929-1-bernd.kuhls@t-online.de>
Message-ID: <20210101194113.10929-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../python-requests-oauthlib/python-requests-oauthlib.hash  | 6 +++---
 .../python-requests-oauthlib/python-requests-oauthlib.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
index 784ad8e692..d33cabfefc 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.hash
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-oauthlib/json
-md5	c32a54ce04123480132960a290d50792  requests-oauthlib-1.2.0.tar.gz
-sha256	bd6533330e8748e94bf0b214775fed487d309b8b8fe823dc45641ebcd9a32f57  requests-oauthlib-1.2.0.tar.gz
+md5  1ebcd55f1b1b9281940b4bc33010e2ba  requests-oauthlib-1.3.0.tar.gz
+sha256  b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a  requests-oauthlib-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
+sha256  ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
index 41dca1abdd..9fe5b186b0 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.mk
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.2.0
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.3.0
 PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
-PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/de/a2/f55312dfe2f7a344d0d4044fdfae12ac8a24169dc668bd55f72b27090c32
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/23/eb/68fc8fa86e0f5789832f275c8289257d8dc44dbe93fce7ff819112b9df8f
 PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
 PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.29.2
