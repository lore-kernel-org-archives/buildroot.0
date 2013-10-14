From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Oct 2013 20:24:31 +0200
Subject: [Buildroot] [PATCH 1/1] support/kconfig: Fix typo in
	README.buildroot.
Message-ID: <1381775071-14556-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix typo in README.buildroot (s/config/kconfig/).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 support/kconfig/README.buildroot | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index d3d8613..0e16e81 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -3,12 +3,12 @@ to suit Buildroot.
 
 To update:
 	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
-	cd support/config.new
+	cd support/kconfig.new
 	cp -a ../kconfig/patches ../kconfig/README.buildroot .
 	quilt push -a
 	# Fix any conflict
 	cd ..
-	rm -rf config
+	rm -rf kconfig
 	mv kconfig.new kconfig
 
 Then verify the toplevel targets work:
-- 
1.8.1.4
