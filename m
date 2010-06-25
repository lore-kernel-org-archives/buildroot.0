From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jun 2010 00:02:26 +0200
Subject: [Buildroot] [pull request] Pull request for branch initramfs-dep-fix
Message-ID: <cover.1277503341.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f4abd4e61215b119d38ccba011a901732ce704e4:
  Peter Huewe (1):
        docs: Fixed spelling error in buildroot.html GETTEXT instead of GNUTTEXT

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot initramfs-dep-fix

Thomas Petazzoni (2):
      initramfs: only show the option when a Linux kernel is being built
      initramfs: update help text

 fs/initramfs/Config.in |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)

Thanks,
-- 
Thomas Petazzoni
