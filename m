From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 22:55:04 +0100
Subject: [Buildroot] [git commit] package/Config.in: correct capitalization
	of menu item
Message-ID: <20151223215511.2429381DA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef411e75caa910c782dc93307af0e60f1f6c54c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index de0ad5e..5892c43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -949,7 +949,7 @@ menu "Javascript"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
-menu "external jQuery plugins"
+menu "External jQuery plugins"
 	source "package/jquery-datetimepicker/Config.in"
 	source "package/jquery-keyboard/Config.in"
 	source "package/jquery-mobile/Config.in"
