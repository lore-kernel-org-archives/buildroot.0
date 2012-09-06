From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Sep 2012 22:55:01 +0200
Subject: [Buildroot] [git commit] vala: move to 'Development tools' submenu
Message-ID: <20120906210346.CE83B9959E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e4d40751ed22f9a36ec541686456075b0808d59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vala isn't an X application.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e129522..7fd26a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,7 @@ source "package/sstrip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
+source "package/vala/Config.in"
 source "package/yasm/Config.in"
 endmenu
 
@@ -160,7 +161,6 @@ source "package/rdesktop/Config.in"
 source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
-source "package/vala/Config.in"
 source "package/x11vnc/Config.in"
 source "package/xstroke/Config.in"
 source "package/xterm/Config.in"
