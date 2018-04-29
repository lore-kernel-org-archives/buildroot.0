From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:49:00 +0200
Subject: [Buildroot] [git commit] libdvbsi: add hash for license file
Message-ID: <20180429165326.82B9B805FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca5cc075a91fb08965e3f53d5cbfd0a08d44004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvbsi/libdvbsi.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libdvbsi/libdvbsi.hash b/package/libdvbsi/libdvbsi.hash
index 7454625afe..3628fdbdbe 100644
--- a/package/libdvbsi/libdvbsi.hash
+++ b/package/libdvbsi/libdvbsi.hash
@@ -1,2 +1,5 @@
 # From http://www.saftware.de/libdvbsi++/libdvbsi++-0.3.7.tar.bz2.md5
 md5	7eb50352c06b17c499a6d51e18e99ec5	libdvbsi++-0.3.7.tar.bz2
+
+# Hash for license file:
+sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	COPYING
