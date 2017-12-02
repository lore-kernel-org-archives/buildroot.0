From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 17:11:16 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: add hash for license file
Message-ID: <20171202161116.1015-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 8adccaf84..d8526e93a 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	68663a67450a8d6734e137eac54cc7077209fb15c456eec401a2c26e6386eff6	lxc-2.1.1.tar.gz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
-- 
2.14.1
