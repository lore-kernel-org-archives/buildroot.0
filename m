From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 23:30:23 +0200
Subject: [Buildroot] [pull request] Pull request for branch other-build-fixes
Message-ID: <cover.1279488610.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 1eb59f598f52b65b3d3adfcf74729091e95015f0:
  Peter Korsgaard (1):
        CHANGES: #2191 is resolved

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot other-build-fixes

Thomas Petazzoni (2):
      neon: explicit path to xml2-config
      alsa-lib: make sure to only look in STAGING_DIR for Python includes

 package/multimedia/alsa-lib/alsa-lib.mk |    4 +++-
 package/neon/neon.mk                    |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
