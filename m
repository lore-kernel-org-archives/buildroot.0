From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  3 Feb 2020 22:10:05 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/qt5serialport: update hash
 source URL
Message-ID: <20200203211006.31507-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Be more specific for the hash source URL and change from
summary page (.mirrorlist) to direct sha256 download page
(.sha256).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5serialport/5.12.7/qt5serialport.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5serialport/5.12.7/qt5serialport.hash b/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
index d042154ebe..43136542d8 100644
--- a/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
@@ -1,4 +1,4 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.sha256
 sha256 224c282ebed750f46b72dfe18260c3d26fbb74e928dec64bd8c51e7beed8721f qtserialport-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
-- 
2.25.0
