From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:53:34 +0100
Subject: [Buildroot] [git commit] package/qt5webview: drop qt 5.6 support
Message-ID: <20200309140908.289B67FB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55e5b3464b212dd729b25e5f89f692958b4e4a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webview/qt5webview.hash | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index d9d340479b..7bbb23556b 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/archive/qt/5.6/5.6.3/submodules/qtwebview-opensource-src-5.6.3.tar.xz.sha256
-sha256 768a456e89f0fd7cbf39ac6b282e078a098e7426651c0b3d453b10c5c44bd81c qtwebview-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebview-everywhere-src-5.12.7.tar.xz.sha256
 sha256 d3f82d2ceab59dc4dee3b6f54f4b70869c199d63f4534b299d900cdacc9b7be7 qtwebview-everywhere-src-5.12.7.tar.xz
 
