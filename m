From: Iulian Onofrei <iulian.onofrei@yahoo.com>
Date: Mon, 31 Aug 2020 00:26:37 +0300
Subject: [Buildroot] [PATCH 1/2] package/libeXosip2: fix typos in help text
In-Reply-To: <20200830123610.20164-1-iulian.onofrei@yahoo.com>
References: <20200830123610.20164-1-iulian.onofrei@yahoo.com>
Message-ID: <20200830212640.60919-1-iulian.onofrei@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Iulian Onofrei <iulian.onofrei@yahoo.com>
---
 package/libeXosip2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 4cb8218f20..9fbe9789f8 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_LIBEXOSIP2
 	select BR2_PACKAGE_LIBOSIP2
 	help
 	  eXosip is a library that hides the complexity of using the
-	  SIP protocol for mutlimedia session establishement.
+	  SIP protocol for multimedia session establishment.
 	  This protocol is mainly to be used by VoIP telephony
 	  applications (endpoints or conference server) but might be
-	  also usefull for any application that wish to establish
+	  also useful for any application that wish to establish
 	  sessions like multiplayer games.
 	  eXosip is based in libosip.
 
-- 
2.24.3 (Apple Git-128)
