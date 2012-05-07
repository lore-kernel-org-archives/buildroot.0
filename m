From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:10 +0200
Subject: [Buildroot] [PATCH 6/8] libeXosip2: fix comment and URL in
	menuconfig
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libeXosip2/Config.in |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 8adca5a..755d284 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
 	select BR2_PACKAGE_LIBOSIP2
 	help
-	  GNU Higher level SIP (Session Initiation Protocol)
-	  This library aims to provide multimedia and telecom software
-	  developers an easy and powerful interface to initiate and
-	  control SIP based sessions in their applications.
-	  SIP is a open standard replacement from IETF for H323.
+	  eXosip is a library that hides the complexity of using the
+	  SIP protocol for mutlimedia session establishement.
+	  This protocol is mainly to be used by VoIP telephony
+	  applications (endpoints or conference server) but might be
+	  also usefull for any application that wish to establish
+	  sessions like multiplayer games. 
+	  eXosip is based in libosip.
 
-	  http://www.gnu.org/software/osip/
+	  http://savannah.nongnu.org/projects/exosip/
-- 
1.7.5.4
