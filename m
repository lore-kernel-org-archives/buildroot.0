From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:29:24 +0200
Subject: [Buildroot] [PATCH 16/16] merge mcookie
In-Reply-To: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aba3a5340035bd73743a7e5e8f0b3fade5895cb6.1314826051.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/x11r7/mcookie/mcookie.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index d1c4354..b3530de 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -15,7 +15,7 @@ define MCOOKIE_BUILD_CMDS
 	(cd $(@D); $(TARGET_CC) -Wall -Os -s mcookie.c -o mcookie)
 endef
 
-define MCOOKIE_TARGET_INSTALL_CMDS
+define MCOOKIE_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/mcookie $(TARGET_DIR)/usr/bin/mcookie
 endef
 
-- 
1.7.4.1
