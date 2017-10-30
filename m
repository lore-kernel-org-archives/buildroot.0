From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Oct 2017 09:54:46 +0100
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20171030084750.D5B89800D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebe8538720ac4606e871e71fce951bb340703ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 62f498e..dbfb288 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1088,8 +1088,8 @@ menu "Graphics"
 	source "package/gtksourceview/Config.in"
 	source "package/harfbuzz/Config.in"
 	source "package/ijs/Config.in"
-	source "package/irrlicht/Config.in"
 	source "package/imlib2/Config.in"
+	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
 	source "package/kmsxx/Config.in"
@@ -1863,8 +1863,8 @@ comment "Utilities"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
-	source "package/file/Config.in"
 	source "package/easy-rsa/Config.in"
+	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
 	source "package/inotify-tools/Config.in"
