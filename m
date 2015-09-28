From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 28 Sep 2015 23:27:21 +0200
Subject: [Buildroot] [PATCH 1/4] libssh/libssh.mk:normalize header separator
	size to 80
Message-ID: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libssh/libssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 39cff50..ded5e8c 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -2,7 +2,7 @@
 #
 ## libssh
 #
-#################################################################################
+################################################################################
 
 LIBSSH_VERSION = 0.7.1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
-- 
1.9.1
