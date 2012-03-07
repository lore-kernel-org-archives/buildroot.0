From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:26:48 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/ccache-fixes
Message-ID: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit b50f7a832de2801aeee33146ff5a81945f4078c2:

  barebox: fix 2012.03 typo (2012-03-07 16:26:50 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/ccache-fixes

Thomas Petazzoni (2):
      ccache: Force ccache to use its internal zlib.
      ccache: set COMPILERCHECK to 'none'

 Config.in                |    7 +++++++
 package/ccache/ccache.mk |   23 +++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

Thanks,
-- 
Thomas Petazzoni
