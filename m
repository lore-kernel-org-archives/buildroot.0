From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 11:02:34 +0200
Subject: [Buildroot] [git commit master] e2fsprogs: bump version
Message-ID: <20100331090329.78A8A7F99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=801f22b356550122ab6c8b56085150666f79900f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1423

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    1 +
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 34c5f5b..7c64c84 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,6 +29,7 @@
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 	#1411: [SECURITY] Update openssl package to 0.9.8n
 	#1417: Bump iptables to 1.4.7
+	#1423: Bump e2fsprogs to 1.41.11
 	#1429: [SECURITY] Update php to 5.2.13
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 21915ec..09db996 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VERSION:=1.41.9
+E2FSPROGS_VERSION:=1.41.11
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
-- 
1.6.3.3
