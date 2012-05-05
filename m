From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 May 2012 18:26:04 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/libaio
Message-ID: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit aa96b4ea99b362decc524a8632c7a2c1a7586e83:

  CHANGES: GDB 4.7.1, not GCC (2012-05-03 23:29:08 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/libaio

for you to fetch changes up to 7b0e3e05280562b758638a0582516394a3164675:

  libaio: use alternative upstream URL (2012-05-05 18:25:13 +0200)

----------------------------------------------------------------
Thomas Petazzoni (2):
      libaio: make available only on supported architectures
      libaio: use alternative upstream URL

 package/libaio/Config.in |    4 ++++
 package/libaio/libaio.mk |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

Thanks,
-- 
Thomas Petazzoni
