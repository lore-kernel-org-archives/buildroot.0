From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 11:56:03 +0200
Subject: [Buildroot] [git commit] exim: move to "Mail" menu
Message-ID: <20140406095613.81EBE9C58D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5c0d8dd8fec2dcf64f609d9b2e230216b28d3de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9d8b31f..cc28d51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -857,6 +857,7 @@ source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Mail"
+source "package/exim/Config.in"
 source "package/fetchmail/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/libesmtp/Config.in"
@@ -897,7 +898,6 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
-source "package/exim/Config.in"
 source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
