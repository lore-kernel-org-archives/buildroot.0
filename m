From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 22:07:07 +0200
Subject: [Buildroot] [git commit] gupnp-av: add hash for license file
Message-ID: <20170705200929.4191E7FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df1ba7cf665bb26c5cdb00e8552f5797075ee4aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp-av/gupnp-av.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 8fe7782..e106b18 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.10.sha256sum:
 sha256	8038ef84dddbe7ad91c205bf91dddf684f072df8623f39b6555a6bb72837b85a	gupnp-av-0.12.10.tar.xz
+
+# Hash for license file:
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
