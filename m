From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 09:44:31 +0200
Subject: [Buildroot] [git commit] qt5: give numbers to patch files
Message-ID: <20131002074535.9C8BE9B90E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62802d24c07b0b5c5c4b9f5775ed49463c2a6891
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ce-add-egl-to-CONFIG-to-get-correct-incl.patch} |    0
 ...iles.patch => qt5base-0002-mkspecs-files.patch} |    0
 ...-lfs.patch => qt5base-0003-uclibc-no-lfs.patch} |    0
 ...ckend-0001-dont-import-bz2-python-module.patch} |    0
 ...bc.patch => qt5jsbackend-0002-fix-uclibc.patch} |    0
 ....patch => qt5webkit-0001-egl-includepath.patch} |    0
 6 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch b/package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
rename to package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-mkspecs-files.patch
rename to package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
diff --git a/package/qt5/qt5base/qt5base-uclibc-no-lfs.patch b/package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
rename to package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch b/package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
similarity index 100%
rename from package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
rename to package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch b/package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
similarity index 100%
rename from package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
rename to package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
diff --git a/package/qt5/qt5webkit/qt5webkit-egl-includepath.patch b/package/qt5/qt5webkit/qt5webkit-0001-egl-includepath.patch
similarity index 100%
rename from package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
rename to package/qt5/qt5webkit/qt5webkit-0001-egl-includepath.patch
