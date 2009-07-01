From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2009 16:56:35 +0200
Subject: [Buildroot] [pull request] Fix Matchbox build
Message-ID: <20090701165635.310644fb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit
e61606ad39735000e66b6048d9be1b9d27c36bd0: Peter Korsgaard (1):
        CHANGES: add issue 349 + 379

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot matchbox-fix

Thomas Petazzoni (1):
      Fix Matchbox build

 package/matchbox/Config.in                   |    1 +
 package/matchbox/matchbox.mk                 |    7 ++++++-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk     |    2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
