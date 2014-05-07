From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 May 2014 22:09:41 +0200
Subject: [Buildroot] [PATCH v5 07/32] mesa3d: Add patch note about upstream
	bug
In-Reply-To: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399493406-7247-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...a3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
index 79df1ce..53ba519 100644
--- a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
+++ b/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
@@ -8,6 +8,8 @@ only installed if Mesa3d is compiled with EGL support.
 
 This patch installs this header file unconditionally.
 
+Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=77240
+
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
  src/egl/main/Makefile.am | 3 ---
-- 
1.7.10.4
