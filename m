From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:46:50 +0200
Subject: [Buildroot] [git commit] memcached: bump version to 1.4.37
Message-ID: <20170605134656.AFDE582A5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b862a4fa5ad68467b7a9773e53e8b8c99d1aae7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index f9f68d5..1a88cc7 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.36.tar.gz.sha1
-sha1 519b417515206b0b95ff9bf14106a891f6a2252e  memcached-1.4.36.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.37.tar.gz.sha1
+sha1 6a6c2ab70e9470fef939afff1cb58b7602077611  memcached-1.4.37.tar.gz
 # Calculated based on the hash above
-sha256 773b6bb20bf80223ca6a15d75f570fbab346ad11ec98595e5af5e33f54bd82d8  memcached-1.4.36.tar.gz
+sha256 2f335ab9110ce39036c5271ef39a582a852e424bc9659e421844073cfdf8606b  memcached-1.4.37.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 90ede7d..087be57 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.36
+MEMCACHED_VERSION = 1.4.37
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
