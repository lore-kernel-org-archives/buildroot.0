From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 22:42:39 +0200
Subject: [Buildroot] [git commit] package/pcre2: bump version to 10.31
Message-ID: <20180623204033.7F85C81ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ee2d59ba8f03a18f086a748d5c3c422261ef076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/pcre2.hash | 6 ++++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 7b125dda9d..210e2e58c1 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,2 +1,4 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.30.tar.bz2.sig
-sha256 90bd41c605d30e3745771eb81928d779f158081a51b2f314bbcc1f73de5773db  pcre2-10.30.tar.bz2
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.31.tar.bz2.sig
+sha256 e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac  pcre2-10.31.tar.bz2
+# Locally computed
+sha256 4806d1c067bffe106d97dac68744373a866bfdd65486c0532ed1b41595ec4b64  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 3844622858..49ece6b9dc 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.30
+PCRE2_VERSION = 10.31
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
