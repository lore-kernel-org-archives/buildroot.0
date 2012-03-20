From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 09:17:45 +0100
Subject: [Buildroot] [pull request] Pull request for branch liburcu-arch
Message-ID: <cover.1332231460.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit b5fd0f2709cab72f48da12a5804dd8670fffbf6e:

  Change the /etc/mtab symlink to use an absolute path (2012-03-19 17:08:13 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git liburcu-arch

Thomas Petazzoni (1):
      liburcu: only some architectures are supported

 package/liburcu/Config.in      |    1 +
 package/lttng-libust/Config.in |    2 ++
 package/lttng-tools/Config.in  |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
