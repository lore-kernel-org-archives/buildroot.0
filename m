From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2009 12:00:42 +0200
Subject: [Buildroot] [pull request] Qtopia fixes
Message-ID: <20090703120042.490a0e81@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e61606ad39735000e66b6048d9be1b9d27c36bd0:
  Peter Korsgaard (1):
        CHANGES: add issue 349 + 379

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot qtopia-fixes

Thomas Petazzoni (3):
      Fix Qtopia build with external toolchain
      Bump Qtopia version to 4.5.2
      New build fix for Qtopia4

 .../qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch   |   20 ++++++++++++++++++++
 package/qtopia4/qtopia4.mk                         |    4 +++-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
