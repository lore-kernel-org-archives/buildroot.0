From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 15:38:34 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/doc-updates
Message-ID: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d8de970bae3744fe830e96a1ae0c4aff6ce47ba1:
  Peter Korsgaard (1):
        uClibc: sys/ptrace.h fix for 0.9.31 / powerpc so ltrace builds

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/doc-updates

Thomas Petazzoni (8):
      documentation: clarify Buildroot steps
      documentation: Tell not to use make -jN
      documentation: Remove mention of gcc 3.x
      documentation: Update details about external toolchains
      documentation: Mention which external toolchains we tested
      documentation: Reword introduction about external toolchains
      documentation: Document the GIT/SVN download capabilities
      documentation: Mention the fact that the skeleton location can be configured

 docs/buildroot.html |  145 ++++++++++++++++++++++++++++++++-------------------
 1 files changed, 92 insertions(+), 53 deletions(-)

Thanks,
-- 
Thomas Petazzoni
