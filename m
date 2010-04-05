From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Apr 2010 22:39:18 +0200
Subject: [Buildroot] [pull request] Pull request for branch libaio-conversion
Message-ID: <cover.1270499953.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 6cdcc4d7d8134f4b60f0eb9039090f9ad4c38366:
  Peter Korsgaard (1):
        gcc: hide shared libgcc option if BR2_PREFER_STATIC_LIB is enabled

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot libaio-conversion

Thomas Petazzoni (1):
      libaio: convert to the GENTARGETS infrastructure

 package/libaio/libaio.mk |   52 +++++++++++----------------------------------
 1 files changed, 13 insertions(+), 39 deletions(-)

Thanks,
-- 
Thomas Petazzoni
