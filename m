From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2013 12:29:28 +0100
Subject: [Buildroot] [git commit branch/next] support/kconfig: update our
	README
Message-ID: <20131114124850.283F69BBB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d431d8c6db58d1ac8d21b10077f68f3d4ed39705
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The procedure to update our copy of kconfig was mising copying a file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/README.buildroot |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 0e16e81..6f65715 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -4,7 +4,7 @@ to suit Buildroot.
 To update:
 	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
 	cd support/kconfig.new
-	cp -a ../kconfig/patches ../kconfig/README.buildroot .
+	cp -a ../kconfig/patches ../kconfig/README.buildroot ../kconfig/.gitignore .
 	quilt push -a
 	# Fix any conflict
 	cd ..
