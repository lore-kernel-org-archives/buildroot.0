From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 12 Jan 2014 21:34:34 +0800
Subject: [Buildroot] [PATCH] zsh: bump to version 5.0.5
Message-ID: <1389533674.29736.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/zsh/zsh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index ca865a4..70b2fb1 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION=5.0.2
+ZSH_VERSION=5.0.5
 ZSH_SITE=http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
-- 
1.8.1.2
