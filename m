From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 21 Nov 2013 14:47:37 +0100
Subject: [Buildroot] [PATCH] schifra: fix post install hook
Message-ID: <1385041657-32313-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/schifra/schifra.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 730bd06..4611e67 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -27,7 +27,7 @@ define SCHIFRA_INSTALL_EXAMPLES
 	done
 endef
 
-SCHIFRA_POST_TARGET_INSTALL_HOOKS += SCHIFRA_INSTALL_EXAMPLES
+SCHIFRA_POST_INSTALL_TARGET_HOOKS += SCHIFRA_INSTALL_EXAMPLES
 endif
 
 define SCHIFRA_INSTALL_TARGET_CMDS
-- 
1.8.4.3
