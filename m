From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  3 Jun 2014 02:31:00 +0400
Subject: [Buildroot] [PATCH v2 0/2] xserver_xorg-server: add ordering prefix
	to patches
Message-ID: <1401748262-4192-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series renames existing xserver_xorg-server patches to comply with
documentation and adds support for xtensa architecture.

Changes v1->v2:
- put sequence number at the right place of the patch file names

Max Filippov (2):
  xserver_xorg-server: add ordering prefix to patches
  xserver_xorg-server: add support for xtensa architecture

 ...ps.patch => xserver_xorg-server-100-mips.patch} |    0
 ...rver_xorg-server-200-add-support-for-arc.patch} |    0
 ...tensa-add-support-for-xtensa-architecture.patch |   74 ++++++++++++++++++++
 3 files changed, 74 insertions(+), 0 deletions(-)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-mips.patch => xserver_xorg-server-100-mips.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-add-support-for-arc.patch => xserver_xorg-server-200-add-support-for-arc.patch} (100%)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-300-xtensa-add-support-for-xtensa-architecture.patch

-- 
1.7.7.6
