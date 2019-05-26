From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:28:43 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/turbolua: replace
 utf-8 apostrophe by ascii single quote
Message-ID: <20190526072358.109148E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f96a08eb8751d66b906bed8aeb609800b24da239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea6ed8bde924624a38e3b3c0c64825a31cf747aa)
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
