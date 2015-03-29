From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 13:35:25 +0200
Subject: [Buildroot] [git commit] distclean: clean a bit more
Message-ID: <20150329113639.B36E480776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad24d833058e443fdd62c7f409b4c00d5c3f7c0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 33a89b1..edb122b 100644
--- a/Makefile
+++ b/Makefile
@@ -843,7 +843,8 @@ endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
+	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
+		$(CONFIG_DIR)/.auto.deps
 
 help:
 	@echo 'Cleaning:'
