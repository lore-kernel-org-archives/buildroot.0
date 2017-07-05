From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 22:06:14 +0200
Subject: [Buildroot] [git commit] gupnp: add hash for license file
Message-ID: <20170705200929.2D40F7FAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a02ac344c8faea389963e52566f269ab8ea9038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp/gupnp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 48aeb49..7fb44ff 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.1.sha256sum:
 sha256	934584cc1b361bf251a5ac271ffb1995a3c6426ce44cb64f9c6d779f2af9a6d9	gupnp-1.0.1.tar.xz
+
+# Hash for license file:
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
