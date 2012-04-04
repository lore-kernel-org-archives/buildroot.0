From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed,  4 Apr 2012 16:46:57 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/packages-updates
Message-ID: <cover.1333550801.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 2e59d1d7ed669fc0a8e563a37b418ea424b6eefe:

  e2fsprogs: bump to version 1.42.2 (2012-04-03 23:27:02 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.05/packages-updates

Maxime Ripard (2):
      Convert gettext to autotargets
      Bump systemd to version 44

 package/gettext/Config.in                   |   12 --
 package/gettext/gettext.mk                  |  168 +++------------------------
 package/gettext/libdir-la.patch             |  154 ------------------------
 package/systemd/systemd-fix-page-size.patch |   43 +++++++
 package/systemd/systemd.mk                  |   24 +++--
 5 files changed, 72 insertions(+), 329 deletions(-)
 delete mode 100644 package/gettext/libdir-la.patch
 create mode 100644 package/systemd/systemd-fix-page-size.patch

Thanks,
-- 
Maxime Ripard
