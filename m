From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 30 Apr 2019 14:21:50 +0200
Subject: [Buildroot] [PATCH] package/popt: add hash for the license file
Message-ID: <20190430122150.19007-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/popt/popt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/popt/popt.hash b/package/popt/popt.hash
index 875bbae7a3..1422f4b920 100644
--- a/package/popt/popt.hash
+++ b/package/popt/popt.hash
@@ -1,2 +1,3 @@
 # Locally calculated:
 sha256	e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8	popt-1.16.tar.gz
+sha256	518d4f2a05064cb9a8ec0ea02e86408af4feed6916f78ef42171465db8b383c5	COPYING
-- 
2.21.0
