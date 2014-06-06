From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Jun 2014 16:45:03 +0200
Subject: [Buildroot] [PATCH 1/1] fetchmail: Update project URL after
	shutdown of berlios.de
Message-ID: <1402065903-2779-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 3419821..1eb0359 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_FETCHMAIL
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local computer
 
-	  http://sourceforge.net/projects/fetchmail/
+	  http://www.fetchmail.info/
-- 
1.7.10.4
