From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Apr 2021 21:55:27 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/libtomcrypt: update home page
 URL to https
In-Reply-To: <20210412195527.9282-1-ps.report@gmx.net>
References: <20210412195527.9282-1-ps.report@gmx.net>
Message-ID: <20210412195527.9282-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update home page URL to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.31.1
