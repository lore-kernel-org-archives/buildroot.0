From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 18:10:21 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: add the xconfig target to the
	help of the main Makefile
In-Reply-To: <cover.1248711019.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248711019.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7e7576c3d8687a779882d17df9b12ce8486c1ec6.1248711019.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.0.4
