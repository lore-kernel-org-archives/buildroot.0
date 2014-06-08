From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:50:49 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: add ordering prefix
	to patches
Message-ID: <20140608135457.4A2449CF0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e84c20b5b08cc5386bcc3525736b93cc57d462f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is to keep patch application order correct and to comply with
documentation.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ps.patch => xserver_xorg-server-100-mips.patch} |    0
 ...rver_xorg-server-200-add-support-for-arc.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-100-mips.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch
rename to package/x11r7/xserver_xorg-server/xserver_xorg-server-100-mips.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-add-support-for-arc.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-200-add-support-for-arc.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-add-support-for-arc.patch
rename to package/x11r7/xserver_xorg-server/xserver_xorg-server-200-add-support-for-arc.patch
