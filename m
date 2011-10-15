From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:16 -0300
Subject: [Buildroot] [PATCH 02/25] radvd: security bump to version 1.8.2
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
