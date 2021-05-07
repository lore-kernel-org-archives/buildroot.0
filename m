From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 May 2021 09:32:46 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libtomcrypt:
 update home page URL to https
Message-ID: <20210507071029.DDF30883C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bbffd8816f9613ea9133c69f96f23bb6b1306b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- update home page URL to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 27b30ee74253abafb6ea083fcee065e4a957224a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtomcrypt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtomcrypt/Config.in b/package/libtomcrypt/Config.in
index a7c5f50015..2459cd21e8 100644
--- a/package/libtomcrypt/Config.in
+++ b/package/libtomcrypt/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBTOMCRYPT
 	  functions, chaining modes, pseudo-random number generators,
 	  public key cryptography and a plethora of other routines.
 
-	  http://www.libtom.net
+	  https://www.libtom.net
