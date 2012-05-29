From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 29 May 2012 12:00:20 +0200
Subject: [Buildroot] [pull request V2] Pull request for branch
	for-2012.08/systemd
Message-ID: <cover.1338285613.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 3ae7d814075095b43e25c8ef11be6a14234241cc:

  pkg-download.mk: Add missing argument when downloading from primary mirror (scp) (2012-05-23 21:49:40 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.08/systemd

for you to fetch changes up to 23dac19640ec6f2095e128c8b641ca2d5a0be8a1:

  Add systemd unit for lighttpd (2012-05-29 11:59:34 +0200)

----------------------------------------------------------------
Maxime Ripard (2):
      Rework of the init system
      Add systemd unit for lighttpd

 package/lighttpd/lighttpd.mk      |   11 +++++++++++
 package/lighttpd/lighttpd.service |   10 ++++++++++
 package/pkg-gentargets.mk         |    8 ++++++++
 package/sysvinit/Config.in        |    1 +
 target/generic/Config.in          |   25 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/lighttpd/lighttpd.service

Thanks,
-- 
Maxime Ripard
