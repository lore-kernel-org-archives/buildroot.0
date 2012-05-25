From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 25 May 2012 14:11:05 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.08/systemd
Message-ID: <cover.1337947838.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 3ae7d814075095b43e25c8ef11be6a14234241cc:

  pkg-download.mk: Add missing argument when downloading from primary mirror (scp) (2012-05-23 21:49:40 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.08/systemd

for you to fetch changes up to 30c344249e25e6684ddf939ad65fa55aa69e455c:

  Add systemd unit for lighttpd (2012-05-25 14:07:29 +0200)

----------------------------------------------------------------
Maxime Ripard (2):
      Rework of the init system
      Add systemd unit for lighttpd

 package/lighttpd/lighttpd.mk      |   11 +++++++++++
 package/lighttpd/lighttpd.service |   10 ++++++++++
 package/pkg-gentargets.mk         |    8 ++++++++
 package/sysvinit/Config.in        |    1 +
 target/generic/Config.in          |   28 ++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/lighttpd/lighttpd.service

Thanks,
-- 
Maxime Ripard
