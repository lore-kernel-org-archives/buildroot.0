From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Nov 2013 14:51:07 +0100
Subject: [Buildroot] [git commit] schifra: fix post install hook
Message-ID: <20131121135131.D6E209BD7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af0813b09a9452784ae001ca54f415791b81d2c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/schifra/schifra.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
