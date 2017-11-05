From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:06 +0100
Subject: [Buildroot] [git commit] package/libglib2: add license hash
Message-ID: <20171105163752.174BE80282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e927a7087d448ee779f3dd558c68780a85c6160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglib2/libglib2.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index fb9321e..cf1c955 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,4 @@
 # https://download.gnome.org/sources/glib/2.54/glib-2.54.2.sha256sum
 sha256  bb89e5c5aad33169a8c7f28b45671c7899c12f74caf707737f784d7102758e6c  glib-2.54.2.tar.xz
+# License files, locally calculated
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
