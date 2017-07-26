From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 16:53:32 +0200
Subject: [Buildroot] [git commit] tcpdump: security bump to 4.9.1
Message-ID: <20170726145004.2E5D581941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e58888571416c78eb3fad74e364418e33acbd94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-11108/Fix bounds checking for STP

Changelog: http://www.tcpdump.org/tcpdump-changes.txt

[Peter: add signature link as suggested by Baruch]
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 966db1f..4eedc1c 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256 eae98121cbb1c9adbedd9a777bf2eae9fa1c1c676424a54740311c8abcee5a5e  tcpdump-4.9.0.tar.gz
+# Locally calculated after checking pgp signature at http://www.tcpdump.org/release/tcpdump-4.9.1.tar.gz.sig
+sha256 f9448cf4deb2049acf713655c736342662e652ef40dbe0a8f6f8d5b9ce5bd8f3  tcpdump-4.9.1.tar.gz
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 0e779a5..8349748 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.9.0
+TCPDUMP_VERSION = 4.9.1
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
