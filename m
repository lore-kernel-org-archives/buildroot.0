From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 12:11:03 +0100
Subject: [Buildroot] [pull request] Pull request for branch libatomic-arch
Message-ID: <cover.1332241780.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a fix about libatomic_ops. However, it is worth noting that
according to http://www.hpl.hp.com/research/linux/atomic_ops/, the
official website of libatomic_ops, this library is no longer
maintained. It is currently used by libdrm and pulseaudio in
Buildroot. Does anyone knows what are the up-to-date andmaintained
alternatives?

Best regards,

Thomas

The following changes since commit b5fd0f2709cab72f48da12a5804dd8670fffbf6e:

  Change the /etc/mtab symlink to use an absolute path (2012-03-19 17:08:13 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git libatomic-arch

Thomas Petazzoni (1):
      libatomic_ops: make it available only on supported architectures

 package/libatomic_ops/Config.in |    1 +
 package/libdrm/Config.in        |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
