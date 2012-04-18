From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 18 Apr 2012 13:29:20 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/package-fixes
Message-ID: <cover.1334748542.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e5ece0d8eebf2f908b952141130664d3a6430f67:

  Add apr-package (2012-04-17 16:44:19 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.05/package-fixes

Maxime Ripard (3):
      Fix systemd failure with lock files
      Fix systemd failure with media devices
      Fix qt samples dependency on QtGUI

 fs/skeleton/etc/group      |    1 +
 package/qt/Config.in       |    1 +
 package/systemd/systemd.mk |    5 +++++
 3 files changed, 7 insertions(+), 0 deletions(-)

Thanks,
-- 
Maxime Ripard
