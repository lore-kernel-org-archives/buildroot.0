From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:36:29 +0200
Subject: [Buildroot] [git commit] package/libsigc: add license hash
Message-ID: <20190703224540.9209387FEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8132ed50426eb408336d8a3d2745bd6c4e40e6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsigc/libsigc.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index a630534e84..bc3880f7c3 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.0.sha256sum
 sha256	f843d6346260bfcb4426259e314512b99e296e8ca241d771d21ac64f28298d81	libsigc++-2.10.0.tar.xz
+
+# Locally calculated
+sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
