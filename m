From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Oct 2016 17:41:12 +0200
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20161006154645.4FEC5801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ac77e653c30853348df57fb096e1ef2c3496d78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index ef82b2e..c3bcf73 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1461,8 +1461,8 @@ menu "Networking applications"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
-	source "package/gupnp-tools/Config.in"
 	source "package/gesftpserver/Config.in"
+	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
 	source "package/hiawatha/Config.in"
