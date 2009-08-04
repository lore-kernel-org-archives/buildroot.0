From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 17:17:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	config-choice-fixes
Message-ID: <cover.1249399026.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 5b72dda69f72e1953dfc7987dd1b418e1afe79a4:
  Peter Korsgaard (1):
        buildroot: fix fallout after qtopia4 -> qt rename

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot config-choice-fixes

Thomas Petazzoni (2):
      webkit: only show the rendering backend choice when webkit is enabled
      ipsec-tools: only show the security context choice when ipsec enabled

 package/ipsec-tools/Config.in |    4 ++++
 package/webkit/Config.in      |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
