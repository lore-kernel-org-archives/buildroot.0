From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Oct 2011 14:47:57 +0200
Subject: [Buildroot] [git commit] picocom: remove useless arguments from
	GENTARGETS
Message-ID: <20111006124854.267D98E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e2244d6a439c2c5fa0dfeb11a6fa949158b0adf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/picocom/picocom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index fa02594..fce50d9 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -15,4 +15,4 @@ define PICOCOM_INSTALL_TARGET_CMDS
 	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
 endef
 
-$(eval $(call GENTARGETS,package,picocom))
+$(eval $(call GENTARGETS))
