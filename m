From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 15:16:44 +0200
Subject: [Buildroot] [git commit] package/libtomcrypt: update home page URL
 to https
Message-ID: <20210501124944.1A24E8655B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27b30ee74253abafb6ea083fcee065e4a957224a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update home page URL to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
