From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] xorg: remove reference to non-existing
	BR2_PACKAGE_XSERVER_none
Message-ID: <20090725071549.367F577713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f2d8a44f263c24ff7858ed26e91f2505c8b66dd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7e7ca00..e7550d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -321,7 +321,6 @@ source "package/qtopia4/Config.in"
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
-#XXX: maybe some of these should depend on !BR2_PACKAGE_XSERVER_none
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
 source "package/pango/Config.in"
-- 
1.6.3.3
