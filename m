From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Mar 2012 09:06:16 +0200
Subject: [Buildroot] [pull request] Pull request for branch for-2012.05/perl
Message-ID: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit b5fd0f2709cab72f48da12a5804dd8670fffbf6e:

  Change the /etc/mtab symlink to use an absolute path (2012-03-19 17:08:13 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/perl

Thomas Petazzoni (2):
      microperl: fix MICROPERL_INSTALL_TARGET_CMDS
      microperl: install host-microperl in $(HOST_DIR)/opt/perl

 package/microperl/microperl.mk |   28 ++++++++++++++++++----------
 1 files changed, 18 insertions(+), 10 deletions(-)

Thanks,
-- 
Thomas Petazzoni
