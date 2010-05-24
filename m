From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 May 2010 22:33:24 +0200
Subject: [Buildroot] [pull request] Pull request for branch gettext-fixes
Message-ID: <cover.1274733199.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 096b21e552b05b68a846172e320ae3e38dee16ac:
  Peter Korsgaard (1):
        pciutils: fix access to pci.ids and make update-pciids work with busybox wget

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot gettext-fixes

Thomas Petazzoni (3):
      Improve gettext integration
      Update packages to BR2_NEEDS_GETTEXT_IF_LOCALE
      Add documentation on gettext integration

 docs/buildroot.html              |   58 ++++++++++++++++++++++++++++++++++++++
 package/avahi/Config.in          |    4 +-
 package/avahi/avahi.mk           |    2 +-
 package/gmpc/Config.in           |    4 +-
 package/gmpc/gmpc.mk             |    2 +-
 package/grep/Config.in           |    4 +-
 package/grep/grep.mk             |    2 +-
 package/hal/Config.in            |    4 +-
 package/hal/hal.mk               |    2 +-
 package/libidn/Config.in         |    1 +
 package/libidn/libidn.mk         |    2 +-
 package/libsoup/Config.in        |    2 +
 package/libsoup/libsoup.mk       |    2 +-
 package/make/Config.in           |    4 +-
 package/make/make.mk             |    2 +-
 package/pango/Config.in          |    2 +
 package/pango/pango.mk           |    2 +-
 package/psmisc/Config.in         |    4 +-
 package/psmisc/psmisc.mk         |    2 +-
 package/sshfs/Config.in          |    4 +-
 package/sshfs/sshfs.mk           |    2 +-
 package/util-linux/Config.in     |    4 +-
 package/util-linux/util-linux.mk |    2 +-
 toolchain/Config.in.2            |   17 ++++++++---
 24 files changed, 102 insertions(+), 32 deletions(-)

Thanks,
-- 
Thomas Petazzoni
