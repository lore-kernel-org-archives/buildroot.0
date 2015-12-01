From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:34:35 +0100
Subject: [Buildroot] [git commit branch/next] samba4: bump to version 4.3.2
Message-ID: <20151201163444.8EC547FF9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd36c24093966c7ecff227357dd345a159c156ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash |    2 +-
 package/samba4/samba4.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 48860a7..2959e5b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9908a80d95b9e2583906ed4347a8c80b769539a2788158992fb48ea9fb4d2c82	samba-4.3.1.tar.gz
+sha256	61989195caadf0f6fb51ce6bed5e203e6146facc2c276a26ad41901ad9129a75	samba-4.3.2.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 1d02e86..388a40c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.1
+SAMBA4_VERSION = 4.3.2
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
