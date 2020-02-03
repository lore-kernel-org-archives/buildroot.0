From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  3 Feb 2020 22:10:06 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/qt5x11extras: update hash source
 URL
In-Reply-To: <20200203211006.31507-1-ps.report@gmx.net>
References: <20200203211006.31507-1-ps.report@gmx.net>
Message-ID: <20200203211006.31507-2-ps.report@gmx.net>
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
 package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
index b8174a86dc..06cdb9c87b 100644
--- a/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
@@ -1,4 +1,4 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtx11extras-everywhere-src-5.12.7.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtx11extras-everywhere-src-5.12.7.tar.xz.sha256
 sha256 23895f4b1e84f3783526b9e17680df38c587601d4dfa6ff1b81ace432c480b96 qtx11extras-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
-- 
2.25.0
