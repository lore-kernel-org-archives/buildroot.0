From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:58:14 +0100
Subject: [Buildroot] [git commit] package/crudini: upgrade to 0.8
Message-ID: <20161202225846.279CE8016B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=874f9aa3964c898353c805fa07e9dd18eaa740f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crudini/crudini.hash | 6 +++---
 package/crudini/crudini.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index b9aaecf..2796e7a 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7d1313f1bb9800db9cbceaa518bcf212, sha256 locally computed
-md5    7d1313f1bb9800db9cbceaa518bcf212 crudini-0.7.tar.gz
-sha256 5d493ae6600e54f9e0296b12d3adba99b88a439d8c4b2ebf9bc6f9c0613a03d7  crudini-0.7.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0664fa2f9d36e411e839b5394d8c2951, sha256 locally computed
+md5    0664fa2f9d36e411e839b5394d8c2951 crudini-0.8.tar.gz
+sha256 effdf8feb7efe252af87143c8756bbc69e2679afb6173083d38be02284385e5f  crudini-0.8.tar.gz
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index d797efc..9dfd174 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.7
+CRUDINI_VERSION = 0.8
 CRUDINI_SOURCE = crudini-$(CRUDINI_VERSION).tar.gz
-CRUDINI_SITE = https://pypi.python.org/packages/source/c/crudini
+CRUDINI_SITE = https://pypi.python.org/packages/23/4a/934b05bbe5af4fd390207c5e935efbae6439809aad65ab0702e236c1b5f5
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPLv2
 CRUDINI_LICENSE_FILES = COPYING
