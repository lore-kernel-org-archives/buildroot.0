From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 20:37:33 +0100
Subject: [Buildroot] [git commit] package/doom-wad: add an upstream URL to
 Config.in
Message-ID: <20191126192938.3455D83771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e80874cd7f2093ad7aa3912620c44a6641373e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
