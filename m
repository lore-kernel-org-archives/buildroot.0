From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Dec 2020 23:07:23 +0100
Subject: [Buildroot] [PATCH v1 26/31] package/qt5webkit: format hash file
 according to two spaces guideline
In-Reply-To: <20201210220726.22216-1-ps.report@gmx.net>
References: <20201210220726.22216-1-ps.report@gmx.net>
Message-ID: <20201210220726.22216-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webkit/qt5webkit.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 3068ad920d..312d58272a 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -2,6 +2,6 @@
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
 
 # Hashes for license files:
-sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805 Source/WebCore/LICENSE-LGPL-2
-sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce Source/WebCore/LICENSE-LGPL-2.1
-sha256 a3db6c7f3027aa27489c25a2fa259185cdee945780c32e01c60cbfabf4743b6c LICENSE.LGPLv21
+sha256  7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  Source/WebCore/LICENSE-LGPL-2
+sha256  f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  Source/WebCore/LICENSE-LGPL-2.1
+sha256  a3db6c7f3027aa27489c25a2fa259185cdee945780c32e01c60cbfabf4743b6c  LICENSE.LGPLv21
-- 
2.29.2
