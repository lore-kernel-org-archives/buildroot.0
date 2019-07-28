From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 22:44:30 +0200
Subject: [Buildroot] [PATCH 3/7] package/taglib: add license hash
In-Reply-To: <20190728204434.12356-1-bernd.kuhls@t-online.de>
References: <20190728204434.12356-1-bernd.kuhls@t-online.de>
Message-ID: <20190728204434.12356-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/taglib/taglib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 7a5c5cf98c..4b99e86d68 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256 b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b  taglib-1.11.1.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256 53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
-- 
2.20.1
