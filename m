From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:39:46 +0200
Subject: [Buildroot] [pull request] Pull request for branch 2010-05-10-fixes
Message-ID: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit af850ce10fc490036247a8c0dd92c79f18b2281a:
  Peter Korsgaard (1):
        Merge branch 'squashfs-fixes' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot 2010-05-10-fixes

Thomas Petazzoni (5):
      grep: give hints to ./configure on where gettext() is
      hostapd: use internal crypto library
      less: depends on curses
      netplug: disable -Werror to fix build failure
      libnl: include limits.h to fix build failure

 package/grep/grep.mk                               |    1 +
 package/hostapd/hostapd.mk                         |    1 +
 package/less/less.mk                               |    1 +
 package/libnl/libnl-1.1-netlink-local-fix.patch    |   19 +++++++++++++++++
 package/netplug/netplug-1.2.9-disable-werror.patch |   22 ++++++++++++++++++++
 5 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/libnl/libnl-1.1-netlink-local-fix.patch
 create mode 100644 package/netplug/netplug-1.2.9-disable-werror.patch

Thanks,
-- 
Thomas Petazzoni
