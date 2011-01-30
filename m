From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:37:44 +0100
Subject: [Buildroot] [pull request] Pull request for branch doc-updates
Message-ID: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 0fa46e59db087478b4844b2358a496eacdef7569:
  Peter Korsgaard (1):
        lzo: build shared library for host and target

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot doc-updates

Thomas Petazzoni (6):
      Explain why we don't support ELDK toolchains.
      Update documentation about external toolchain
      Remove more or less inexact option concerning custom target skeleton
      Use <code> instead of <pre> to improve formatting
      Do not mention toolchain/uClibc/uClibc.config-locale
      documentation: mention we can't use the distro toolchain as external

 docs/buildroot.html |  113 +++++++++++++++++++++++++++++++++++---------------
 1 files changed, 79 insertions(+), 34 deletions(-)

Thanks,
-- 
Thomas Petazzoni
