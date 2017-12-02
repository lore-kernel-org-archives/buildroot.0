From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 15:34:33 +0100
Subject: [Buildroot] [PATCH 1/1] libmediaart: add hash for license file
Message-ID: <20171202143433.18032-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmediaart/libmediaart.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index 65cf3cf9a..d51c05622 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.4.sha256sum:
 sha256	a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d	libmediaart-1.9.4.tar.xz
+
+# Locally computed:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LESSER
-- 
2.14.1
