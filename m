From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 09:16:14 +0200
Subject: [Buildroot] [git commit] package/turbolua: replace utf-8 apostrophe
 by ascii single quote
Message-ID: <20190508073739.9CF3A83B6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea6ed8bde924624a38e3b3c0c64825a31cf747aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/turbolua/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
index 34f66ef131..6e792ebba5 100644
--- a/package/turbolua/Config.in
+++ b/package/turbolua/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_TURBOLUA
 	  uses a event-driven, non-blocking, no thread design to deliver
 	  excellent performance and minimal footprint to high-load
 	  applications while also providing excellent support for
-	  embedded uses. The toolkit can be used for HTTP REST API???s,
+	  embedded uses. The toolkit can be used for HTTP REST API's,
 	  traditional dynamic web pages through templating, open
 	  connections like WebSockets, or just as high level building
 	  blocks for native speed network applications.
