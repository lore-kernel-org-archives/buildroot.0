From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 10 Feb 2018 14:11:38 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit{,
 -examples}: use https link in hashfile
Message-ID: <20180210191138.5518-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All Qt modules but qt5webkit use https link in their hashfile.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webkit-examples/qt5webkit-examples.hash | 4 ++--
 package/qt5/qt5webkit/qt5webkit.hash                   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 2af1efbaf0..6e4c090fdd 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-examples-opensource-src-5.6.3.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-examples-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 2d6ce7146298d03b443cca4390bbfee17c4c0b08a31efcbf9fe0732291a6169e qtwebkit-examples-opensource-src-5.6.3.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0 qtwebkit-examples-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index aa3a71c8d0..57ff2ac1b7 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,7 +1,7 @@
-# Hash from: http://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256  098c6bb25798fbf1b619b540621287787064efc9b586d76ac0ce7e39b87a3896  qtwebkit-opensource-src-5.6.3.tar.xz
 
-# hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
+# hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
 
 # Hashes for license files:
-- 
2.15.1
