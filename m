From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Feb 2011 08:46:27 +0100
Subject: [Buildroot] [pull request] Pull request for branch ep93xx-directfb
Message-ID: <cover.1297151183.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit c761eafb021c2beaf52b2d1a383433deac5fc2b4:
  Thomas Petazzoni (1):
        openssl: pass LDFLAGS to fix incorrect link

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot ep93xx-directfb

Thomas Petazzoni (1):
      Add support for DirectFB EP9x driver

 package/directfb/Config.in   |    4 ++++
 package/directfb/directfb.mk |    3 ++-
 2 files changed, 6 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
