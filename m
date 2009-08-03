From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Aug 2009 10:13:35 +0200
Subject: [Buildroot] [pull request] Pull request for branch oldconfig-fix
Message-ID: <cover.1249287213.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4840c451d93afb59725900b1d6ca84645113b897:
  Peter Korsgaard (1):
        Merge branch 'lvm-bump' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot oldconfig-fix

Thomas Petazzoni (1):
      kconfig: fix oldconfig to generate .config.cmd

 package/config/conf.c                      |    4 ++
 package/config/confdata.c                  |    4 +--
 package/config/kconfig-to-buildroot2.patch |   47 +++++++++++++++------------
 3 files changed, 31 insertions(+), 24 deletions(-)

Thanks,
-- 
Thomas Petazzoni
