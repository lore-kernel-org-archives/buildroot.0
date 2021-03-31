From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Mar 2021 08:00:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/qt5webkit: add
 SoB line to 'Fix ICU related compile failures from capital bool' patch
Message-ID: <20210331053740.84DF97FF45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3188a8f62c4885a132add191edfaa8efdcb6ec9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes: 0f6c209a1d76 ("package/qt5webkit: fix ICU related compile failures from capital bool defines")
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d3bafec202d049aa085ec791afd26bfb2e3bf871)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
