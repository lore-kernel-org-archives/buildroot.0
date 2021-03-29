From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Mar 2021 10:34:59 +0200
Subject: [Buildroot] [git commit] package/qt5webkit: add SoB line to 'Fix
 ICU related compile failures from capital bool' patch
Message-ID: <20210329081028.A62D28A530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3bafec202d049aa085ec791afd26bfb2e3bf871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: 0f6c209a1d76 ("package/qt5webkit: fix ICU related compile failures from capital bool defines")
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
index 04f41afee0..7d941a5683 100644
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
