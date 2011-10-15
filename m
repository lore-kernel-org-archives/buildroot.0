From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:02:54 +0200
Subject: [Buildroot] [git commit] radvd: security bump to version 1.8.2
Message-ID: <20111015213654.352D38E805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=635a7f5e10d552ebb901f81bc56e019bde00c6ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index ac0c0e9..5d07ff6 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -3,10 +3,10 @@
 # radvd
 #
 #############################################################
-RADVD_VERSION:=1.6
-RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
-RADVD_SITE:=http://www.litech.org/radvd/dist/
-RADVD_DEPENDENCIES:=flex host-flex
+
+RADVD_VERSION = 1.8.2
+RADVD_SITE = http://www.litech.org/radvd/dist/
+RADVD_DEPENDENCIES = flex host-flex
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
