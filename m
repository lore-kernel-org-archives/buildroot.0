From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:32:58 -0000
Subject: [Buildroot] [git commit] libeXosip2: fix comment and URL in
	menuconfig
Message-ID: <20120531113257.0E20C96E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eef36a8e865a2998e49d08e67883e5211c8d17cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
