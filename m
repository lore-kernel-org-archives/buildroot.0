From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:46:00 +0100
Subject: [Buildroot] [PATCH v2 29/37] package/qt5webview: drop qt 5.6 support
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-29-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
-- 
2.20.1
