From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 00:00:46 +0100
Subject: [Buildroot] [git commit] gupnp-dlna: add hash for license file
Message-ID: <20171202230428.6241B82224@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=834db4a1e8e1f5618558879eead33b637f3e9f80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gupnp-dlna/gupnp-dlna.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gupnp-dlna/gupnp-dlna.hash b/package/gupnp-dlna/gupnp-dlna.hash
index c28a06f..01c7489 100644
--- a/package/gupnp-dlna/gupnp-dlna.hash
+++ b/package/gupnp-dlna/gupnp-dlna.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.10/gupnp-dlna-0.10.5.sha256sum:
 sha256	123e368227c11d5c17fc1aa76cbdaffa345355eb51d172cd39fc74a5b468ff6a	gupnp-dlna-0.10.5.tar.xz
+
+# Locally computed:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
