From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  3 Jun 2014 01:41:45 +0400
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: add ordering prefix to
	patches
In-Reply-To: <1401745306-2162-1-git-send-email-jcmvbkbc@gmail.com>
References: <1401745306-2162-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1401745306-2162-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is to keep patch application order correct and to comply with
documentation.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...ps.patch => 100-xserver_xorg-server-mips.patch} |    0
 ...-xserver_xorg-server-add-support-for-arc.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-mips.patch => 100-xserver_xorg-server-mips.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-add-support-for-arc.patch => 200-xserver_xorg-server-add-support-for-arc.patch} (100%)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch b/package/x11r7/xserver_xorg-server/100-xserver_xorg-server-mips.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch
rename to package/x11r7/xserver_xorg-server/100-xserver_xorg-server-mips.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-add-support-for-arc.patch b/package/x11r7/xserver_xorg-server/200-xserver_xorg-server-add-support-for-arc.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-add-support-for-arc.patch
rename to package/x11r7/xserver_xorg-server/200-xserver_xorg-server-add-support-for-arc.patch
-- 
1.7.7.6
