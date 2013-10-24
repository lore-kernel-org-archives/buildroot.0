From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 24 Oct 2013 15:16:27 +0200
Subject: [Buildroot] [PATCH 2/2] packages/Config.in: Fix case on entries
	titles
In-Reply-To: <1382620587-22563-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382620587-22563-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1382620587-22563-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ebbdeb5..b1ceb16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,7 +169,7 @@ source "package/gnuplot/Config.in"
 source "package/jhead/Config.in"
 source "package/rrdtool/Config.in"
 
-comment "graphic libraries"
+comment "Graphic libraries"
 source "package/cegui06/Config.in"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
@@ -241,7 +241,7 @@ source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 source "package/x11r7/xkeyboard-config/Config.in"
 
-comment "X Window managers"
+comment "X window managers"
 source "package/blackbox/Config.in"
 source "package/enlightenment/Config.in"
 source "package/fluxbox/Config.in"
-- 
1.8.4.rc3
