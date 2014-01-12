From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 19:09:05 +0100
Subject: [Buildroot] [git commit] zsh: bump to version 5.0.5
Message-ID: <20140112182938.7C8AD9C459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57fc5df9e9accde40e034ae788ebf5d03556cbbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
