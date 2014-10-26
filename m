From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 14:10:24 +0100
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.21
Message-ID: <20141026131132.A0F03B06C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b65188b1c86c12e0c0b98f9d85e6610ca5ef0734
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memcached/memcached.hash |    2 ++
 package/memcached/memcached.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
new file mode 100644
index 0000000..7acbaf4
--- /dev/null
+++ b/package/memcached/memcached.hash
@@ -0,0 +1,2 @@
+# From http://www.memcached.org/files/memcached-1.4.21.tar.gz.sha1
+sha1	ab10c46dd9f5d4401872d9670e575afa5bc7d66f	memcached-1.4.21.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 4efe093..c057d57 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.20
+MEMCACHED_VERSION = 1.4.21
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
