From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:43:36 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/luasyslog: update
 the upstream URL in Config.in
Message-ID: <20191205213908.6D4CD7FABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee6c898d87f6ecece5e690da6c539cf70f80814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0d9c7347f00fe2676553060f19fd50943728bf93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luasyslog/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luasyslog/Config.in b/package/luasyslog/Config.in
index 814e7ad37e..326fa6bf9b 100644
--- a/package/luasyslog/Config.in
+++ b/package/luasyslog/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUASYSLOG
 	help
 	  Syslog logging for Lua.
 
-	  http://lua.net-core.org/sputnik.lua?p=Telesto:About
+	  https://luarocks.org/modules/luarocks/luasyslog
