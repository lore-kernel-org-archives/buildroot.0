From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  3 Jun 2014 01:41:44 +0400
Subject: [Buildroot] [PATCH 0/2] xserver_xorg-server: add support for xtensa
	architecture
Message-ID: <1401745306-2162-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series renames existing xserver_xorg-server patches to comply with
documentation and adds support for xtensa architecture.

Max Filippov (2):
  xserver_xorg-server: add ordering prefix to patches
  xserver_xorg-server: add support for xtensa architecture

 ...ps.patch => 100-xserver_xorg-server-mips.patch} |    0
 ...-xserver_xorg-server-add-support-for-arc.patch} |    0
 ...tensa-add-support-for-xtensa-architecture.patch |   74 ++++++++++++++++++++
 3 files changed, 74 insertions(+), 0 deletions(-)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-mips.patch => 100-xserver_xorg-server-mips.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-add-support-for-arc.patch => 200-xserver_xorg-server-add-support-for-arc.patch} (100%)
 create mode 100644 package/x11r7/xserver_xorg-server/300-xserver_xorg-server-xtensa-add-support-for-xtensa-architecture.patch

-- 
1.7.7.6
