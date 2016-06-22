From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 10:33:39 +0200
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20160622083404.D5FDB8213A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841cbf632033bed5ab1a4651b6ebd3bf786b610d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 171f4ad..a2a02a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1390,8 +1390,8 @@ menu "Networking applications"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
 	source "package/c-icap-modules/Config.in"
-	source "package/cannelloni/Config.in"
 	source "package/can-utils/Config.in"
+	source "package/cannelloni/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
