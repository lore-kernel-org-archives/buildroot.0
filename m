From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:00:57 +0100
Subject: [Buildroot] [git commit] package/prboom: fix typo in help text
Message-ID: <20160322090106.12FB57F9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc36638089b25da51362c8b1bd6ab8ba85d9c492
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rendring -> rendering

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/prboom/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prboom/Config.in b/package/prboom/Config.in
index e9a3d4a..6884f31 100644
--- a/package/prboom/Config.in
+++ b/package/prboom/Config.in
@@ -8,6 +8,6 @@ config BR2_PACKAGE_PRBOOM
 	help
 	  PrBoom is a Doom client which allows you to play the good old game on
 	  newer hardware. It even supports higher resolution and better
-	  rendring, while still keeping the old style alive.
+	  rendering, while still keeping the old style alive.
 
 	  http://prboom.sourceforge.net/
