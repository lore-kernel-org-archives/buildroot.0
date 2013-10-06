From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 21:32:23 +0200
Subject: [Buildroot] [git commit] git: bump to version 1.8.4.1
Message-ID: <20131006194411.7EEC19B8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de06c9cece89e966b3eb2de1dc5e0ee7a0e43786
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index b8a7623..58455b1 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.3
+GIT_VERSION         = 1.8.4.1
 GIT_SITE            = http://git-core.googlecode.com/files/
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
