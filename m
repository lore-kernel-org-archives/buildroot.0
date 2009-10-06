From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Oct 2009 22:43:06 +0200
Subject: [Buildroot] [git commit master] atmel mirrors are only needed for
	atmel targets
Message-ID: <20091006204457.E139E77788@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7abeebf54d51e33578495d3779b2015c991779a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/device/Config.in.mirrors |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/device/Config.in.mirrors b/target/device/Config.in.mirrors
index c647801..e0b1d07 100644
--- a/target/device/Config.in.mirrors
+++ b/target/device/Config.in.mirrors
@@ -64,7 +64,7 @@ config BR2_DEBIAN_MIRROR
 
 	  Usually, just add your country code like XX here:
 	  http://ftp.XX.debian.org
-
+if BR2_TARGET_ATMEL
 source	"target/device/Atmel/Config.in.mirrors"
-
+endif
 endmenu
-- 
1.6.3.3
