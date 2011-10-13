From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Oct 2011 09:48:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/fix-busybox-mdev-conf
Message-ID: <cover.1318492132.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit bde4564fa74cc25a088aa4173709894d2acf5844:

  radvd: show it in config menu when toolchain lacks ipv6 (2011-10-11 16:10:30 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/fix-busybox-mdev-conf

Thomas Petazzoni (1):
      busybox: enable CONFIG_FEATURE_MDEV_RENAME

 package/busybox/busybox-1.16.x.config |    2 +-
 package/busybox/busybox-1.17.x.config |    2 +-
 package/busybox/busybox-1.18.x.config |    2 +-
 package/busybox/busybox-1.19.x.config |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

Thanks,
-- 
Thomas Petazzoni
