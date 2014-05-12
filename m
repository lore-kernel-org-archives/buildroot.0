From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:53:19 +0200
Subject: [Buildroot] [git commit] mesa3d: Add patch note about upstream bug
Message-ID: <20140512205829.8DD959CBAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a945c10d5255895f7ee53363c9961b90178b936
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...atform.h-not-installed-if-EGL-is-disabled.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
