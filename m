From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 09:00:01 +0200
Subject: [Buildroot] [git commit] binutils: move patches to new model
Message-ID: <20130423070519.EC5B99B7C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61eea455be3ac10fa40099b811830673d18f546e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On commit 5538e4766201aa0c1c23721cfc99cbbde595964b the versioned package
patches changed the directory structure but the packages weren't fixed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../110-arm-eabi-conf.patch                        |    0
 .../{binutils-2.20.1 => 2.20.1}/120-sh-conf.patch  |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../400-arm_link_speed.patch                       |    0
 .../{binutils-2.20.1 => 2.20.1}/500-sysroot.patch  |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../{binutils-2.21.1 => 2.21.1}/120-sh-conf.patch  |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../{binutils-2.21.1 => 2.21.1}/500-sysroot.patch  |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../{binutils-2.21 => 2.21}/120-sh-conf.patch      |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../{binutils-2.21 => 2.21}/500-sysroot.patch      |    0
 .../{binutils-2.22 => 2.22}/120-sh-conf.patch      |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../{binutils-2.22 => 2.22}/500-sysroot.patch      |    0
 .../{binutils-2.22 => 2.22}/999-ppc-textrels.patch |    0
 .../{binutils-2.23.1 => 2.23.1}/120-sh-conf.patch  |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../{binutils-2.23.1 => 2.23.1}/500-sysroot.patch  |    0
 .../{binutils-2.23.2 => 2.23.2}/120-sh-conf.patch  |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../{binutils-2.23.2 => 2.23.2}/500-sysroot.patch  |    0
 29 files changed, 0 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
