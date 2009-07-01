From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2009 16:57:10 +0200
Subject: [Buildroot] [pull request] Dropbear fix
Message-ID: <20090701165710.1b509a0a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit
e61606ad39735000e66b6048d9be1b9d27c36bd0: Peter Korsgaard (1):
        CHANGES: add issue 349 + 379

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot dropbear-fix

Thomas Petazzoni (1):
      Fix dropbear compilation with glibc

 .../dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
