From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 21 Mar 2016 20:33:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/prboom: fix typo in help text
In-Reply-To: <1458588788-13625-1-git-send-email-joerg.krause@embedded.rocks>
References: <1458588788-13625-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1458588788-13625-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rendring -> rendering

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
-- 
2.7.4
