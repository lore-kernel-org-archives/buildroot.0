From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 16:21:34 +0200
Subject: [Buildroot] [git commit] config: reorder top-level menu
Message-ID: <20130828142246.948CC9B5D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=244038576b4d45363b328f437b772afc4cfbf9b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorder the entries in the top-menu, in a more significant order.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in         |    6 +++---
 package/Config.in |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 78dea3b..cb246a4 100644
--- a/Config.in
+++ b/Config.in
@@ -450,14 +450,14 @@ source "toolchain/Config.in"
 
 source "system/Config.in"
 
-source "package/Config.in"
+source "linux/Config.in"
 
-source "package/Config.in.host"
+source "package/Config.in"
 
 source "fs/Config.in"
 
 source "boot/Config.in"
 
-source "linux/Config.in"
+source "package/Config.in.host"
 
 source "Config.in.legacy"
diff --git a/package/Config.in b/package/Config.in
index 7069d77..97cd7da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,4 +1,4 @@
-menu "Package Selection for the target"
+menu "Target packages"
 
 source "package/busybox/Config.in"
 
