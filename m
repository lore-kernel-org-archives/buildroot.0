From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 May 2012 11:39:19 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/valgrind-fix
Message-ID: <cover.1336297156.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit a4ee7179e692bdded8b98c54dd484b17098c695d:

  Added the empty package (2012-05-06 10:01:35 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/valgrind-fix

for you to fetch changes up to 92316b7267b614887d3186bcb585dc39206b0a85:

  valgrind: fix build on PowerPC/uClibc (2012-05-06 11:38:30 +0200)

----------------------------------------------------------------
Thomas Petazzoni (1):
      valgrind: fix build on PowerPC/uClibc

 .../valgrind-3.7.0-dont-include-a-out-header.patch |   45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/valgrind/valgrind-3.7.0-dont-include-a-out-header.patch

Thanks,
-- 
Thomas Petazzoni
