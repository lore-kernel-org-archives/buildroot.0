From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  2 Sep 2014 12:22:16 +0200
Subject: [Buildroot] [PATCH 1/1] ccrypt/Config.in: indentation cleanup
Message-ID: <1409653336-22924-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ccrypt/Config.in |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccrypt/Config.in b/package/ccrypt/Config.in
index 99c4d47..ef5a7ee 100644
--- a/package/ccrypt/Config.in
+++ b/package/ccrypt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CCRYPT
-        bool "ccrypt"
-        help
-          ccrypt is a utility for encrypting and decrypting files and streams.
+	bool "ccrypt"
+	help
+	  ccrypt is a utility for encrypting and decrypting files and streams.
 
-          http://ccrypt.sourceforge.net/
+	  http://ccrypt.sourceforge.net/
-- 
1.7.9.5
