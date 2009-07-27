From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 22:09:10 +0200
Subject: [Buildroot] [git commit] Makefile: add the xconfig target to the
	help of the main Makefile
Message-ID: <20090727201013.8246277820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e7576c3d8687a779882d17df9b12ce8486c1ec6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index e61f995..182853c 100644
--- a/Makefile
+++ b/Makefile
@@ -561,6 +561,7 @@ help:
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
+	@echo '  xconfig		- interactive Qt-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
 	@echo '  configured             - make {uclibc/busybox/linux26}-config'
 	@echo '  saveconfig             - save current configuration under local/<project>'
-- 
1.6.3.3
