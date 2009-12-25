From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 25 Dec 2009 12:47:17 +0000
Subject: [Buildroot] [pull request] Pull request for branch bash-reconf-fix
Message-ID: <cover.1261745233.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 9400c73582326c543fae82120af3904836145655:
  Gustavo Zacarias (1):
        Bump mtd-utils to 1.2.0

are available in the git repository at:

  git://git.busybox.net/~nkukard/git/buildroot bash-reconf-fix

Nigel Kukard (1):
      Fix reconfiguration of bash during build

 .../bash/bash32-no-reconfig-for-distribution.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/bash/bash32-no-reconfig-for-distribution.patch

Thanks,
-- 
Nigel Kukard
