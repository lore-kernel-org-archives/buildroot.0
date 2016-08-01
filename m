From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Aug 2016 14:19:37 +0100
Subject: [Buildroot] [PATCH] openssh: bump version to 7.3p1
Message-ID: <1470057577-23450-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 46d9f9b..9a5ffd6 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# Also from http://www.openssh.com/txt/release-7.2
-sha256	a72781d1a043876a224ff1b0032daa4094d87565a68528759c1c2cab5482548c	openssh-7.2p2.tar.gz
+# Also from http://www.openssh.com/txt/release-7.3
+sha256 3ffb989a6dcaa69594c3b550d4855a5a2e1718ccdde7f5e36387b424220fbecc  openssh-7.3p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8f85d0a..ce85513 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.2p2
+OPENSSH_VERSION = 7.3p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.7.3
