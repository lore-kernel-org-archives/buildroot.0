From: Leon Anavi <leon.anavi@konsulko.com>
Date: Fri,  9 Apr 2021 12:00:56 +0300
Subject: [Buildroot] [PATCH 1/1] package/python3-regex: bump to version
 2021.4.4
Message-ID: <20210409090056.6368-1-leon.anavi@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrade to release 2021.4.4 with the following bug fixes:

- regex fails with a quantified backreference but succeeds with
  repeated backref
- API is not a drop-in replacement for python's re when it comes
  to typing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 package/python3-regex/python3-regex.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 9e256263a9..4749cd6167 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  ac88a9c036e626ae4d436e69f35f50cf  regex-2020.2.20.tar.gz
-sha256  9e9624440d754733eddbcd4614378c18713d2d9d0dc647cf9c72f64e39671be5  regex-2020.2.20.tar.gz
+md5  cd206281327b4c087bb20bf93cee4ab9  regex-2021.4.4.tar.gz
+sha256  52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb  regex-2021.4.4.tar.gz
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 8a527c8ee7..c46c4d1614 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-regex/python3-regex.mk
-PYTHON_REGEX_VERSION = 2020.2.20
+PYTHON_REGEX_VERSION = 2021.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/e8/76/8ac7f467617b9cfbafcef3c76df6f22b15de654a62bea719792b00a83195
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = CNRI-Python
 
diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
index f75fb76ace..0b71768e9d 100644
--- a/package/python3-regex/python3-regex.mk
+++ b/package/python3-regex/python3-regex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-regex/python-regex.mk
-PYTHON3_REGEX_VERSION = 2020.2.20
+PYTHON3_REGEX_VERSION = 2021.4.4
 PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
-PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/e8/76/8ac7f467617b9cfbafcef3c76df6f22b15de654a62bea719792b00a83195
+PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
 PYTHON3_REGEX_SETUP_TYPE = setuptools
 PYTHON3_REGEX_LICENSE = CNRI-Python
 HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
-- 
2.17.1
