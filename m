From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 13:51:45 +0100
Subject: [Buildroot] [git commit] package/qt5serialport: update hash source
 URL
Message-ID: <20200204124230.115398A5F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8008018af728b651440622a08bff11f40b1e73f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Be more specific for the hash source URL and change from
summary page (.mirrorlist) to direct sha256 download page
(.sha256).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
