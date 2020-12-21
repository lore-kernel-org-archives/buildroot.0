From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:46:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5webview: drop
 qt 5.6 support
Message-ID: <20201221124323.201D0815EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15c57e17683f370afb8a5407ea66c7c29e6b2ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 55e5b3464b212dd729b25e5f89f692958b4e4a26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webview/qt5webview.hash | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 1a8adfb4b4..e00e73719d 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
-sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebview-everywhere-src-5.12.8.tar.xz.sha256
 sha256  f6492f01c3c0b2b44ffdd9e7d55d11d39e960ea0080cd29555d0a1be43366de4  qtwebview-everywhere-src-5.12.8.tar.xz
 
