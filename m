From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 11 Jan 2012 18:53:37 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch
	for-2012.02/pkg-device
Message-ID: <cover.1326304128.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is an update of the patches adding the $(PKG)_DEVICES and
$(PKG)_PERMISSIONS variables.

In this version, I just added a patch for the documentation presenting a basic
example on how to use such variables.

Maxime

The following changes since commit e6480f2bb91e2df46096ed5f6ef8d3138cd38470:

  sshfs: bump to version 2.3, adjust SITE and description (2012-01-11 15:36:45 +0100)

are available in the git repository at:
  http://free-electrons.com/~maxime/git/buildroot.git for-2012.02/pkg-device

Maxime Ripard (4):
      Add support for package-declared devices
      Convert busybox to the device declaration method
      Migrate Xenomai to the new infrastructure
      Update the documentation to add these changes

 docs/manual/adding-packages-gentargets.txt |   19 +++++++++++++++++--
 fs/common.mk                               |    4 ++++
 package/Makefile.package.in                |    2 ++
 package/busybox/busybox.mk                 |    5 +++++
 package/xenomai/xenomai.mk                 |    8 ++++++--
 target/generic/device_table.txt            |    2 --
 target/generic/device_table_dev.txt        |    5 -----
 7 files changed, 34 insertions(+), 11 deletions(-)

Thanks,
-- 
Maxime Ripard
