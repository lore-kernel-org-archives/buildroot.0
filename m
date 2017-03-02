From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-docutils: bump to version 0.13.1
Message-ID: <20170302205923.2A48382298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e15c98ebb9c0ccd03f7a5a213c39f18635e1a95e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-docutils/python-docutils.hash | 4 ++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 9d45058..23941e7 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5     4622263b62c5c771c03502afa3157768 docutils-0.12.tar.gz
-sha256  c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa  docutils-0.12.tar.gz
+md5 ea4a893c633c788be9b8078b6b305d53 docutils-0.13.1.tar.gz
+sha256 718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be docutils-0.13.1.tar.gz
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index a67d89f..070d805 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-PYTHON_DOCUTILS_VERSION = 0.12
+PYTHON_DOCUTILS_VERSION = 0.13.1
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d
+PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2c, GPLv3 (emacs mode), other
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = distutils
