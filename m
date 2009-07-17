From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 10:35:27 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	external-toolchain
Message-ID: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ea536503331aea875e84ae598b4610fbd059f167:
  Peter Korsgaard (1):
        ruby: needs WCHAR support in toolchain

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot external-toolchain

Thomas Petazzoni (8):
      external toolchain: fix libraries copy and add ARM ABI check
      external-toolchain: better documentation, cleanup, sysroot check
      external toolchain: use LANG=C when calling gcc -v
      external toolchain: more documentation about the principles
      external toolchain: do not copy useless symbolic links
      external toolchain: copy the C++ standard library if needed
      external toolchain: respect $(Q)
      external toolchain: check cross-compiler existence

 toolchain/external-toolchain/ext-tool.mk |  207 +++++++++++++++++++++++-------
 1 files changed, 158 insertions(+), 49 deletions(-)

Thanks,
-- 
Thomas Petazzoni
