From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:06:52 +0200
Subject: [Buildroot] [git commit] unrar: bump to version 5.4.3
Message-ID: <20160723130817.769A080634@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04e5092f5171a8a727ec7c685a6b009429af476f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 4490d70..e6a146c 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	ff593728aed0ac865908b8ea52cff449a4c298f095db2f3d27438ffbc3e35d5b	unrarsrc-5.3.9.tar.gz
+sha256	e4f05190d9e379449a04c22baffc24cc2f03164a4738befe601b1325440db0c6	unrarsrc-5.4.3.tar.gz
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 89dff9b..e49fe6c 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.3.9
+UNRAR_VERSION = 5.4.3
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
