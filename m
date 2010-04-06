From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Apr 2010 21:10:46 +0200
Subject: [Buildroot] [pull request] Pull request for branch libaio-conversion
Message-ID: <cover.1270581037.git.thomas.petazzoni@free-electrons.com>
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

 package/libaio/libaio-0.3.109-arches.patch  |  660 +++++++++++++++++++++++++++
 package/libaio/libaio-0.3.109-destdir.patch |   17 +
 package/libaio/libaio.mk                    |   52 +--
 3 files changed, 690 insertions(+), 39 deletions(-)
 create mode 100644 package/libaio/libaio-0.3.109-arches.patch
 create mode 100644 package/libaio/libaio-0.3.109-destdir.patch

Thanks,
-- 
Thomas Petazzoni
