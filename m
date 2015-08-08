From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next] qt/qt5base: reorder patches
Message-ID: <20150808105639.24DF6803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b122e7d37fe4f9b5976f849c2e867ba220461af3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...kspecs-files.patch => 0002-mkspecs-files.patch} |    0
 ...cb-egl-fixes.patch => 0003-xcb-egl-fixes.patch} |    0
 ...ch => 0004-no-gold-linker-for-host-build.patch} |    0
 ...=> 0005-forkd-disable-eventfd-for-uclibc.patch} |    0
 4 files changed, 0 insertions(+), 0 deletions(-)

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
