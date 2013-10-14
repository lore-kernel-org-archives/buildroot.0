From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:12:14 +0200
Subject: [Buildroot] [git commit] support/kconfig: Fix typo in
	README.buildroot.
Message-ID: <20131014203036.BC30B9A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c5ff4981c44bd933bf620f2c761133e14abe6dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo in README.buildroot (s/config/kconfig/).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/README.buildroot |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
