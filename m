From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 09:09:17 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1332230951.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit b5fd0f2709cab72f48da12a5804dd8670fffbf6e:

  Change the /etc/mtab symlink to use an absolute path (2012-03-19 17:08:13 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git misc-fixes

Thomas Petazzoni (1):
      parted: make sure to select libuuid in util-linux

 package/parted/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
