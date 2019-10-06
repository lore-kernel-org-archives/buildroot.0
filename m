From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Oct 2019 20:28:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/circus: bump to version 0.15.0
Message-ID: <20191006182844.3118-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/circus/circus.hash | 6 +++---
 package/circus/circus.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/circus/circus.hash b/package/circus/circus.hash
index 877ae21c0e..6391f0b5f7 100644
--- a/package/circus/circus.hash
+++ b/package/circus/circus.hash
@@ -1,4 +1,4 @@
-# md5 from https://pypi.python.org/pypi/circus/json, sha256 locally computed
-md5	48e6b220fb0cafca46e3ae1f6ec4bce8  circus-0.14.0.tar.gz
-sha256	b8ca91d8bd87b350fda199488ac9ddff91a546b0c6214a28a2f13393713cf062  circus-0.14.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/circus/json
+md5	ed9082b5ac6ac5786721254b06315183  circus-0.15.0.tar.gz
+sha256	d1603cf4c4f620ce6593d3d2a67fad25bf0242183ea24110d8bb1c8079c55d1b  circus-0.15.0.tar.gz
 sha256  3df739c05a4eed7efdf4987142658d2a4f1243e5f08e72a5ecedac5749c92a49  LICENSE
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index 8b863aa656..d962651924 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CIRCUS_VERSION = 0.14.0
-CIRCUS_SITE = https://pypi.python.org/packages/68/41/02c6f5edea2df80b133a12753aee3e698e9130a5c878a9b0bffcf1e17e65
+CIRCUS_VERSION = 0.15.0
+CIRCUS_SITE = https://files.pythonhosted.org/packages/12/11/b72ee03c3d1fd09c39466954def2eae176d22a9fa5d9e6e8e6b90ee88f56
 CIRCUS_SETUP_TYPE = setuptools
 CIRCUS_LICENSE = Apache-2.0
 CIRCUS_LICENSE_FILES = LICENSE
-- 
2.23.0
