From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 18 Jun 2012 10:50:49 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	for-2012.08/systemd
Message-ID: <cover.1340009350.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 929c3e89a6715ecfdc8055ec82025cee5e8e23a1:

  libfreefare: add missing openssl dependency (2012-06-17 12:19:02 +0200)

are available in the git repository at:

  http://git.free-electrons.com/users/maxime-ripard/buildroot for-2012.08/systemd

for you to fetch changes up to 04cbd51ebed54c86ccf8fc03a3fc2eed1383893b:

  Add systemd unit for lighttpd (2012-06-18 10:40:29 +0200)

----------------------------------------------------------------
Maxime Ripard (2):
      Rework of the init system
      Add systemd unit for lighttpd

 package/busybox/busybox.mk        |    7 +++++++
 package/lighttpd/lighttpd.mk      |   11 +++++++++++
 package/lighttpd/lighttpd.service |   10 ++++++++++
 package/pkg-gentargets.mk         |    8 ++++++++
 target/generic/Config.in          |   25 +++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/lighttpd/lighttpd.service

Thanks,
-- 
Maxime Ripard
