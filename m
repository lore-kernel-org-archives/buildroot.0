From: Henri Roosen <henriroosen@gmail.com>
Date: Mon, 29 Mar 2021 10:28:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5webkit: add SoB line to 'Fix ICU
 related compile failures from capital bool' patch
Message-ID: <20210329082856.12981-1-henri.roosen@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: 0f6c209a1d76 ("package/qt5webkit: fix ICU related compile failures from capital bool defines")
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 ...9-Fix-ICU-related-compile-failures-from-capital-bool-d.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
index 04f41afee037..7d941a5683fe 100644
--- a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
+++ b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
@@ -4,6 +4,8 @@ Date: Thu, 18 Mar 2021 11:53:57 +0100
 Subject: [PATCH] Fix ICU related compile failures from capital bool defines
 
 See ICU-21267
+
+Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
 ---
  .../platform/text/TextBreakIteratorICU.cpp       | 16 ++++++++--------
  Source/WebCore/platform/text/TextCodecICU.cpp    |  2 +-
-- 
2.20.1
