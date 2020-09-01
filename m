From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 21:35:47 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libeXosip2: fix
 typos in help text
Message-ID: <20200901193237.64D6781344@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=073883278f37725ebe37780e1cf11adbe25ba70c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Iulian Onofrei <iulian.onofrei@yahoo.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fef674dbf55db74802e55ada3e2f3a22c55f5e7a)
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
 
