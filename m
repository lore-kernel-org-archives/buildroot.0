From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 09:53:01 +0100
Subject: [Buildroot] [git commit] package/memcached: bump to version 1.6.9
Message-ID: <20201223085641.1678B81540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfebf58aba287b110b489cb6ac365ab8ff64dbb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/memcached/memcached/wiki/ReleaseNotes169

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 1330f6521c..a86a6f9f73 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.8.tar.gz.sha1
-sha1  8f3efd851efc5b822bd991b93d06a271b2fac052  memcached-1.6.8.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.9.tar.gz.sha1
+sha1  42ae062094fdf083cfe7b21ff377c781011c2be1  memcached-1.6.9.tar.gz
 
 # Locally computed
-sha256  e23b3a11f6ff52ac04ae5ea2e287052ce58fd1eadd394622eb65c3598fcd7939  memcached-1.6.8.tar.gz
+sha256  d5a62ce377314dbffdb37c4467e7763e3abae376a16171e613cbe69956f092d1  memcached-1.6.9.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 378f57a276..049e3409f0 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.8
+MEMCACHED_VERSION = 1.6.9
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
