From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:16:32 +0200
Subject: [Buildroot] [git commit] libart: add hash for license file
Message-ID: <20180429162018.A12908901E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92ba3b7f5c2497ba227474bf73f523be5036b98d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libart/libart.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libart/libart.hash b/package/libart/libart.hash
index 769c3bfeab..105277b1f2 100644
--- a/package/libart/libart.hash
+++ b/package/libart/libart.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
 sha256	2a10b1c884bb37c7bd5c5eba59dbd0d28bf68e64a42d7f2083c836f60f8e98fa	libart_lgpl-2.3.21.tar.gz
+
+# Hash for license file:
+sha256	d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5	COPYING
