From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Sep 2014 23:37:36 +0200
Subject: [Buildroot] [git commit] ccrypt/Config.in: indentation cleanup
Message-ID: <20140902214727.D84A19D5CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=122f47a8531f419c7e85c332d65ff12a4020bbda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccrypt/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
