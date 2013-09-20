From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 15:17:38 +0200
Subject: [Buildroot] [git commit] manual generation: update help
Message-ID: <20130920132138.DB43A9B80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55ecab1bbc32f9b4a36b588db1fed4ae0403dd74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'make help' lines for generating the manual did not consider ePub
correctly.  Instead of providing a limitative list for 'make manual', the
text is changed into 'all formats'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 71d94ad..667e233 100644
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
