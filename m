From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:51:41 +0200
Subject: [Buildroot] [git commit] coxpcall: bump to version 1.15.0
Message-ID: <20140419215315.D28799C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c31b5be362e68578a68e4f8450b427548cf50b5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coxpcall/coxpcall.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 11f823f..ec147db 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COXPCALL_VERSION = 1.14.0-1
-COXPCALL_SUBDIR  = coxpcall-1_14_0
+COXPCALL_VERSION = 1.15.0-1
+COXPCALL_SUBDIR  = coxpcall
 COXPCALL_LICENSE = MIT
 
 $(eval $(luarocks-package))
