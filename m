From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 09:08:04 +0200
Subject: [Buildroot] [git commit] package/libeXosip2: fix typos in help text
Message-ID: <20200831070037.08B84875A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fef674dbf55db74802e55ada3e2f3a22c55f5e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Iulian Onofrei <iulian.onofrei@yahoo.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
