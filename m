From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jul 2021 09:20:18 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Makefile: document the
 <pkg>-reinstall target
Message-ID: <20210714064744.217598B496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56edb3b9e387f85eb735fd4a823a3925cea0be9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4899d9ec1b03370cbb4a8eecff3a6556dcc3e2e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 7e896e9077..22bf04a056 100644
--- a/Makefile
+++ b/Makefile
@@ -1140,6 +1140,7 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	@echo '  <pkg>-reinstall        - Restart the build from the install step'
 	$(foreach p,$(HELP_PACKAGES), \
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
