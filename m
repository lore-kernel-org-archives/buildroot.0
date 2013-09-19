From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 12:47:14 +0200
Subject: [Buildroot] [PATCH 2 of 4] manual generation: update help
In-Reply-To: <patchbomb.1379587632@argentina>
References: <patchbomb.1379587632@argentina>
Message-ID: <20ec6e5e9482847e47fe.1379587634@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'make help' lines for generating the manual did not consider ePub correctly.
Instead of providing a limitative list for 'make manual', the text is changed
into 'all formats'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -811,7 +811,7 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
 endif
 	@echo
 	@echo 'Documentation:'
-	@echo '  manual                 - build manual in HTML, split HTML, PDF and txt'
+	@echo '  manual                 - build manual in all formats'
 	@echo '  manual-html            - build manual in HTML'
 	@echo '  manual-split-html      - build manual in split HTML'
 	@echo '  manual-pdf             - build manual in PDF'
