From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 11:58:51 +0100
Subject: [Buildroot] [git commit] libselinux: change to github location
Message-ID: <20150102110711.190AF80806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8eebfd9c1f735baf2f6961c59675f57c82989bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4a7/4a7b71f1471b889abf278882a7735475dd95451b/
http://autobuild.buildroot.net/results/bdf/bdf621c5a893bce51db95f4a8f2814c14d2f6d49/
http://autobuild.buildroot.net/results/7a8/7a8426f60a7377e3b08e6502f4e0b2c738002a79/
http://autobuild.buildroot.net/results/d90/d90e40f7fb6e1a7d429454d04b9f5f69826a842e/

And many more.

The old location doesn't seem active any more. Even though this github URL
looks a bit odd, it is linked from
https://github.com/SELinuxProject/selinux/wiki/Releases

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libselinux/libselinux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 4e55727..e6a7c6b 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSELINUX_VERSION = 2.1.13
-LIBSELINUX_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
