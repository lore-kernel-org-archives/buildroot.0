From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:25:50 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mksh: replace
 utf-8 apostrophe by ascii single quote
Message-ID: <20190526072357.C48E78E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fb4e874c49174de666623551de17b8c0b2175d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f7cd28a1d8d3ed434dc0510d3187a6dbbddee5c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mksh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/Config.in b/package/mksh/Config.in
index 55d1cc15ed..e6ccc90646 100644
--- a/package/mksh/Config.in
+++ b/package/mksh/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_MKSH
 	  secure shell not cut off modern extensions; a shell with
 	  Unicode support; an actively developed, current, and
 	  portable product; one with developers that listen to
-	  their users??? requests and implement them if they
+	  their users' requests and implement them if they
 	  actually make sense.
 
 	  mksh aims to replace pdksh in all but very rare use cases
