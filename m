From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2014 10:22:35 +0100
Subject: [Buildroot] [git commit] grub: bump to 0.97-67
Message-ID: <20140107092342.E548E9C3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a79ea8a60bd43f968e5235deffe6bff7ed140c94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to a more recent version of the Debian patches for grub legacy,
that fix an incorrect build with gcc 4.6.

Fixes #6092 and #2629.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/grub.200-fix_mbr_handling.patch     |   10 +-
 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |   14 +-
 boot/grub/grub.400-nic_update2.patch          | 3332 ++++---------------------
 boot/grub/grub.mk                             |    6 +-
 4 files changed, 475 insertions(+), 2887 deletions(-)

Patch is too large, so refusing to show it
