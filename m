From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:08:06 +0100
Subject: [Buildroot] [git commit branch/next] package/crudini: upgrade to 0.9
Message-ID: <20170219220845.F326581E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3ddd1c1f3304423e7143b99aad151355a3baada
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/crudini/crudini.hash | 6 +++---
 package/crudini/crudini.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 2796e7a..9279847 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0664fa2f9d36e411e839b5394d8c2951, sha256 locally computed
-md5    0664fa2f9d36e411e839b5394d8c2951 crudini-0.8.tar.gz
-sha256 effdf8feb7efe252af87143c8756bbc69e2679afb6173083d38be02284385e5f  crudini-0.8.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9b8500c90467f0a61c714fbe852c2a66, sha256 locally computed
+md5    9b8500c90467f0a61c714fbe852c2a66 crudini-0.9.tar.gz
+sha256 10512a5a2f7b54b42e48a1d00f0c6398947c2ba6c264b9fdef86677f0e949fd3  crudini-0.9.tar.gz
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 501c9e0..8fe3232 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.8
-CRUDINI_SITE = https://pypi.python.org/packages/23/4a/934b05bbe5af4fd390207c5e935efbae6439809aad65ab0702e236c1b5f5
+CRUDINI_VERSION = 0.9
+CRUDINI_SITE = https://pypi.python.org/packages/b5/65/5588903472f30fa01ca4951be00c03a317b27bac4cd1e945bd16b2c1b6d3
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPLv2
 CRUDINI_LICENSE_FILES = COPYING
