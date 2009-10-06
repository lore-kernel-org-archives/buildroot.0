From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:03 +0200
Subject: [Buildroot] [PATCH 1/6] atmel mirrors are only needed for atmel
	targets
In-Reply-To: <cover.1254853146.git.rep.dot.nop@gmail.com>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
