From: Julien CORJON <corjon.j@ecagroup.com>
Date: Fri, 3 Jul 2015 07:20:53 +0000
Subject: [Buildroot] [PATCH 2/3] qt5base: reorder patches
In-Reply-To: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
References: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <e4a1929b-87a5-4ff3-80e3-22d51db2efa7@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 .../qt5/qt5base/{0003-mkspecs-files.patch => 0002-mkspecs-files.patch}    | 0
 .../qt5/qt5base/{0004-xcb-egl-fixes.patch => 0003-xcb-egl-fixes.patch}    | 0
 ...nker-for-host-build.patch => 0004-no-gold-linker-for-host-build.patch} | 0
 ...entfd-for-uclibc.patch => 0005-forkd-disable-eventfd-for-uclibc.patch} | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename package/qt5/qt5base/{0003-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
 rename package/qt5/qt5base/{0004-xcb-egl-fixes.patch => 0003-xcb-egl-fixes.patch} (100%)
 rename package/qt5/qt5base/{0005-no-gold-linker-for-host-build.patch => 0004-no-gold-linker-for-host-build.patch} (100%)
 rename package/qt5/qt5base/{0008-forkd-disable-eventfd-for-uclibc.patch => 0005-forkd-disable-eventfd-for-uclibc.patch} (100%)

diff --git a/package/qt5/qt5base/0003-mkspecs-files.patch b/package/qt5/qt5base/0002-mkspecs-files.patch
similarity index 100%
rename from package/qt5/qt5base/0003-mkspecs-files.patch
rename to package/qt5/qt5base/0002-mkspecs-files.patch
diff --git a/package/qt5/qt5base/0004-xcb-egl-fixes.patch b/package/qt5/qt5base/0003-xcb-egl-fixes.patch
similarity index 100%
rename from package/qt5/qt5base/0004-xcb-egl-fixes.patch
rename to package/qt5/qt5base/0003-xcb-egl-fixes.patch
diff --git a/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch b/package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
similarity index 100%
rename from package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
rename to package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
diff --git a/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch b/package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
similarity index 100%
rename from package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch
rename to package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
-- 
2.1.0
