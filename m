From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 13:33:05 +0200
Subject: [Buildroot] [git commit] python-dataproperty: bump version to 0.23.0
Message-ID: <20170602113408.38AB67FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c1558da8e00aebe94c84d3921332a6fa62044bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 6ab0646..e9de5a4 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5 7b41e6f9b250c4f04f07bbd2999c4259  DataProperty-0.22.0.tar.gz
-sha256 3ed49c923a996cbabc008fba7f2df8b2f303e961d64507348120faaacb6b5157  DataProperty-0.22.0.tar.gz
+md5 cdc032e071164aaf31ab3e2b76cd4a1b  DataProperty-0.23.0.tar.gz
+sha256 be42eba1febaab6e37f5e07d558d87bb79e46092dce7deb2934d788d48e80e82  DataProperty-0.23.0.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 7feeed5..65a8fca 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.22.0
+PYTHON_DATAPROPERTY_VERSION = 0.23.0
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/ed/00/091f46cc81869b925d4001300bef31ea2224436c494d1de7145d4bb56df1
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/6d/40/0e66a33d4f909bc3fff1cb760d1827281207ace7de8dc3f202b5be7d3e65
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
