From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-mutagen: bump to version 1.36.2
Message-ID: <20170302205923.D25BB7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68ae9dcca7e85d6330cc1e27d17335bd7ea5fbca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-mutagen/python-mutagen.hash | 6 +++---
 package/python-mutagen/python-mutagen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index 8970a23..3371006 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/mutagen, sha256 locally computed
-md5	2bd50519d64411626fa22d405afbf078  mutagen-1.36.tar.gz
-sha256	d7ee37e33b8c5893c3ebf66edac31241eb9d48e1dc7ec647bbfbc180565a4bcd  mutagen-1.36.tar.gz
+# md5 from https://pypi.python.org/pypi/mutagen/json, sha256 locally computed
+md5 af52956a1b8976accf402f3104b95a84 mutagen-1.36.2.tar.gz
+sha256 86fe98e941ca305be8ee6bdc6bb0e4e9c473bf9fb69a838fe5bf2fc6124fbcc7 mutagen-1.36.2.tar.gz
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index 8458de5..c80eb98 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.36
+PYTHON_MUTAGEN_VERSION = 1.36.2
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/69/14/4a5c8360a727563291a7159de935ffff2b99ee783928169f0fea7445370f
+PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/e7/8a/61496657e30c2cbeb9b3aa28848e0adbcba7cab0ff0bd8e6206647670088
 PYTHON_MUTAGEN_LICENSE = GPLv2
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = distutils
