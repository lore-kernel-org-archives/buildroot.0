From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Nov 2011 23:36:32 +0100
Subject: [Buildroot] [git commit] busybox: remove old unused quirk handling
Message-ID: <20111123224132.5FEEC8F665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=468f1cac8a2dad537bea6cbdabbf34031ceaae42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The definition of these variables were removed back in June
(7d814728 / f1e4aac4).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9e91136..d18b6d0 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,8 +141,6 @@ endef
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
 define BUSYBOX_CONFIGURE_CMDS
-	$(BUSYBOX_SET_SYSKLOGD)
-	$(BUSYBOX_SET_BB_PWD)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_SET_RPC)
