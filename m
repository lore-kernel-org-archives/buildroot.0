From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 23:49:55 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/debugging-improvements
Message-ID: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e687bb71a028303f326aeebfaf94a3ac1c43b4e4:

  gcc: bump 4.4.x version (2012-03-13 16:27:25 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2011.11/debugging-improvements

Thomas Petazzoni (3):
      debug: do not force installation of gdbserver
      debug: provide an option to copy the gdbserver to the target
      config: improve help text and prompt for debugging related options

 Config.in                                |   33 ++++++++++++++++++-----------
 toolchain/gdb/Config.in                  |    8 +++++++
 toolchain/toolchain-external/ext-tool.mk |   14 ++++++++++++
 3 files changed, 42 insertions(+), 13 deletions(-)

Thanks,
-- 
Thomas Petazzoni
