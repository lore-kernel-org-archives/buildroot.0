From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Apr 2021 22:26:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-sortedcontainers: bump to
 version 2.3.0
Message-ID: <20210418202637.3479601-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation in hash file (two spaces)
- Update hash of LICENSE file (update in year:
  https://github.com/grantjenks/python-sortedcontainers/commit/d127cdde5f77804fe51f355fdad469a0ac7caede)

https://github.com/grantjenks/python-sortedcontainers/blob/v2.3.0/HISTORY.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../python-sortedcontainers/python-sortedcontainers.hash    | 6 +++---
 package/python-sortedcontainers/python-sortedcontainers.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sortedcontainers/python-sortedcontainers.hash b/package/python-sortedcontainers/python-sortedcontainers.hash
index 311bb77e17..d97687dd19 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.hash
+++ b/package/python-sortedcontainers/python-sortedcontainers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sortedcontainers/json
-md5	41a4a1eaf7b85e6b3beb14cfb160bc27  sortedcontainers-2.1.0.tar.gz
-sha256	974e9a32f56b17c1bac2aebd9dcf197f3eb9cd30553c5852a3187ad162e1a03a  sortedcontainers-2.1.0.tar.gz
+md5  660260df593a3769c7b5854f13d574c0  sortedcontainers-2.3.0.tar.gz
+sha256  59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1  sortedcontainers-2.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	7dcf4a5137118a925727b8a1690bc6ea70b156ee6739dbb51fd4d386718d6ce5  LICENSE
+sha256  1db7cae7fce6452e2e608e401a0f953e0133e4c2d75db69fb8ae851d2086f5b6  LICENSE
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
index 43f662a89f..31cab76fd7 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.mk
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SORTEDCONTAINERS_VERSION = 2.1.0
+PYTHON_SORTEDCONTAINERS_VERSION = 2.3.0
 PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
-PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/29/e0/135df2e733790a3d3bcda970fd080617be8cea3bd98f411e76e6847c17ef
+PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/14/10/6a9481890bae97da9edd6e737c9c3dec6aea3fc2fa53b0934037b35c89ea
 PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
 PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
 PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
-- 
2.30.2
