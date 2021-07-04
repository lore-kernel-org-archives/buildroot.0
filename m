From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 10:06:43 +0200
Subject: [Buildroot] [git commit] Makefile: document the <pkg>-reinstall
 target
Message-ID: <20210704073532.457E085E5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4899d9ec1b03370cbb4a8eecff3a6556dcc3e2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 472af5a318..74c238cb20 100644
--- a/Makefile
+++ b/Makefile
@@ -1151,6 +1151,7 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	@echo '  <pkg>-reinstall        - Restart the build from the install step'
 	$(foreach p,$(HELP_PACKAGES), \
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
