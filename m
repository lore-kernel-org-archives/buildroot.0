From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 14:49:32 +0000
Subject: [Buildroot] [PATCH 1/1] package/luasyslog: update the upstream URL
 in Config.in
Message-ID: <20191128144932.12669-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
