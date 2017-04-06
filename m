From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:39:47 +0200
Subject: [Buildroot] [git commit] package: remove trailing whitespace
Message-ID: <20170406203951.71F008274D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6107a75d5e4eb13a93e00258269595b8597eafbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Occurrences were searched using [1]:
check-package --include-only TrailingSpace $(find * -type f)
and manually removed.

[1] http://patchwork.ozlabs.org/patch/729666/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/google-breakpad/google-breakpad.mk | 2 +-
 package/leafnode2/leafnode2.mk             | 2 +-
 package/mbedtls/Config.in                  | 2 +-
 package/protobuf/Config.in                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index fd5a45d..191ee5b 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -15,7 +15,7 @@ GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
 GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
 
-HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support 
+HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support
 
 # Avoid using depot-tools to download this file.
 define HOST_GOOGLE_BREAKPAD_LSS
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 92039c1..4a920cc 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -16,7 +16,7 @@ LEAFNODE2_CONF_ENV = \
 
 # --enable-runas-user use 'news' as default but the configure stop
 # if news doesn't exist on the build host.
-# Use 'root' while cross-compiling 
+# Use 'root' while cross-compiling
 LEAFNODE2_CONF_OPTS = \
 	--sysconfdir=/etc/leafnode2 \
 	--enable-spooldir=/var/spool/news \
diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index ed63f2d..8836984 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	help
 	  Enable support for compression of the content data before it
 	  enters the secure channel as described in RFC 3749.
-	  
+
 	  Warning: TLS compression may make you vulnerable to the CRIME
 	  attack. You should not enable it unless you know for sure CRIME
 	  and similar attacks are not applicable to your particular
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index bccf258..bece56c 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -11,7 +11,7 @@
 #
 # Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
 # *could* technically build with gcc 4.7. This is probably not a big deal,
-# and we can live with requiring gcc 4.8 on PowerPC to build protobuf. 
+# and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
 #
 # The SPARC64 build fails due to a missing definition of Atomic64. This
 # has been fixed on the master branch but the build still breaks due to
