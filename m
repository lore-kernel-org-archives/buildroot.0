From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 12 Aug 2019 22:47:58 +0300
Subject: [Buildroot] [PATCH 1/1] Makefile: add help for show-targets command
Message-ID: <20190812194758.1287-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add help output for "show-targets" command.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 406efd1ab6..8d2070b5d0 100644
--- a/Makefile
+++ b/Makefile
@@ -1132,6 +1132,7 @@ help:
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
+	@echo '  show-targets           - list targets of selected packages'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
-- 
2.22.0
