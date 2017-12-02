From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 00:00:42 +0100
Subject: [Buildroot] [git commit] libmediaart: add hash for license file
Message-ID: <20171202230428.384FF82224@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d5c5ed2061f3f6429d6b6b843762f1fb5fc87ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmediaart/libmediaart.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index 65cf3cf..d51c056 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.4.sha256sum:
 sha256	a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d	libmediaart-1.9.4.tar.xz
+
+# Locally computed:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LESSER
