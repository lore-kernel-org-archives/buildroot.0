From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 13:20:55 +0000
Subject: [Buildroot] [PATCH 1/1] package/doom-wad: add an upstream URL to
 Config.in
Message-ID: <20191126132055.18467-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/doom-wad/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/doom-wad/Config.in b/package/doom-wad/Config.in
index 6f51cfb936..9ef4e3e5a2 100644
--- a/package/doom-wad/Config.in
+++ b/package/doom-wad/Config.in
@@ -7,3 +7,5 @@ config BR2_PACKAGE_DOOM_WAD
 
 	  The wad file will be placed in the /usr/share/games/doom
 	  directory.
+
+	  https://doomwiki.org/wiki/DOOM1.WAD
-- 
2.20.1
