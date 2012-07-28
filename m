From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 28 Jul 2012 09:21:19 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.08/systemd
Message-ID: <cover.1343460025.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit fd08153b9d677d654add6c580b9ccc5c27d672e2:

  Remove unused TARGET_ABI values (2012-07-25 20:27:58 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.08/systemd

for you to fetch changes up to 6784a19dec70861969e093a123abe92f4ace3e56:

  doc: Update the documentation to mention the new PKG_INSTALL_INIT_ variables (2012-07-28 09:17:04 +0200)

----------------------------------------------------------------
Maxime Ripard (3):
      Rework of the init system
      Add systemd unit for lighttpd
      doc: Update the documentation to mention the new PKG_INSTALL_INIT_ variables

 docs/manual/adding-packages-generic.txt |    7 +++++++
 package/busybox/busybox.mk              |    7 +++++++
 package/lighttpd/lighttpd.mk            |   13 +++++++++++--
 package/lighttpd/lighttpd.service       |   10 ++++++++++
 package/pkg-generic.mk                  |    8 ++++++++
 target/generic/Config.in                |   25 +++++++++++++++++++++++++
 6 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 package/lighttpd/lighttpd.service

Thanks,
-- 
Maxime Ripard
