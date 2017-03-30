From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:29:55 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] memcached: bump version
	to 1.4.36
Message-ID: <20170331071606.2124C826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22dd05433e0e0309628489b983569d2d47c57341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

From the release notes
(https://github.com/memcached/memcached/wiki/ReleaseNotes1436):

Important bug fix that could lead to a hung slab mover.  Also improves
memory efficiency of chunked items.

[Peter: add release notes link / mention important bug fix]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit adfe049d85b09a2ce780ce49f8e53d9cfaf90e2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 3876a08..f9f68d5 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.35.tar.gz.sha1
-sha1 787991c0df75defbb91518c9796f8244852a018a  memcached-1.4.35.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.36.tar.gz.sha1
+sha1 519b417515206b0b95ff9bf14106a891f6a2252e  memcached-1.4.36.tar.gz
 # Calculated based on the hash above
-sha256 f4815ac95aa06c0f360052a0a12010533b2b78c3bfe475b171606c1b61469476  memcached-1.4.35.tar.gz
+sha256 773b6bb20bf80223ca6a15d75f570fbab346ad11ec98595e5af5e33f54bd82d8  memcached-1.4.36.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 83d4d59..4de1bf6 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.35
+MEMCACHED_VERSION = 1.4.36
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
