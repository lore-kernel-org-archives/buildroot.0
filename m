From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 23:56:04 +0200
Subject: [Buildroot] [pull request] Pull request for branch gzip-fix
Message-ID: <cover.1249422962.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 5b72dda69f72e1953dfc7987dd1b418e1afe79a4:
  Peter Korsgaard (1):
        buildroot: fix fallout after qtopia4 -> qt rename

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot gzip-fix

Thomas Petazzoni (1):
      gzip: add patch to fix glibc build

 CHANGES                                        |    1 +
 package/gzip/gzip-1.3.12-rename-futimens.patch |   48 ++++++++++++++++++++++++
 package/gzip/gzip.mk                           |    1 +
 3 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/gzip/gzip-1.3.12-rename-futimens.patch

Thanks,
-- 
Thomas Petazzoni
