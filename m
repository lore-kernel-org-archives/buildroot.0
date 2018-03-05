From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Mar 2018 23:18:31 +0100
Subject: [Buildroot] [git commit] musl: bump to version 1.1.19
Message-ID: <20180305222055.8A53882166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1296d57918fd2245f65414db6dad3cec25a97360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for the licence file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.hash | 5 +++--
 package/musl/musl.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 68e6aab1fd..c011bbb711 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://www.musl-libc.org/releases/musl-1.1.18.tar.gz.asc
-sha256	d017ee5d01aec0c522a1330fdff06b1e428cb409e1db819cc4935d5da4a5a118  musl-1.1.18.tar.gz
+# http://www.musl-libc.org/releases/musl-1.1.19.tar.gz.asc
+sha256  db59a8578226b98373f5b27e61f0dd29ad2456f4aa9cec587ba8c24508e4c1d9  musl-1.1.19.tar.gz
+sha256  15d9afbf84041872b4d840ed7d165d3eee786ff3f97e703b10467c259ff4e7d9  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index b1aace0400..fa775d1e78 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.18
+MUSL_VERSION = 1.1.19
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
