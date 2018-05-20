From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:34:15 +0200
Subject: [Buildroot] [PATCH 1/1] libmodbus: add hash for license file
Message-ID: <20180520083415.7732-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodbus/libmodbus.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index b5c4450d6b..2d65e28a34 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637  libmodbus-3.1.4.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
-- 
2.14.1
