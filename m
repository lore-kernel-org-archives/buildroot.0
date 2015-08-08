From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:33 -0000
Subject: [Buildroot] [git commit branch/next] samba4: bump to version 4.2.3
Message-ID: <20150808105632.C86F78190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23269765c8d99251157a5b90ebf59dcb51a26c1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash |    2 +-
 package/samba4/samba4.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 11c15b7..e2b3969 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	27d6c69dc3afee38fd28051001d2d4bdae38c567612a9ec6477bb5567e2abc1e	samba-4.2.2.tar.gz
+sha256	b6dfa5ae4818d891ee2fcff04a5912f4a4fb2394b4f5e66a2a15b428da094c7c	samba-4.2.3.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7d10a0c..c88cc9f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.2.2
+SAMBA4_VERSION = 4.2.3
 SAMBA4_SITE = http://ftp.samba.org/pub/samba
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
