From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 18 Jun 2018 18:49:07 -0400
Subject: [Buildroot] [PATCH 2/2] qt5charts: bump hash for 5.11.0
In-Reply-To: <20180618224907.17322-1-gael.portay@savoirfairelinux.com>
References: <20180618224907.17322-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180618224907.17322-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hash bump was missing commit 4fbb2d143d (qt5: bump latest version to
5.11.0).

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5charts/qt5charts.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index ce1189d0e1..6bd9a9d51b 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtcharts-everywhere-src-5.10.1.tar.xz.mirrorlist
-sha256 4f0d577bf73dd2bbb2765c2cfb493a2d68790fc2c64f42544d31dba806321ec9  qtcharts-everywhere-src-5.10.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.0/submodules/qtcharts-everywhere-src-5.11.0.tar.xz.mirrorlist
+sha256 c46e12beeaabf731ce918c7508d8ab62ae3b675870992faf36878268da4ee351  qtcharts-everywhere-src-5.11.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-- 
2.17.1
