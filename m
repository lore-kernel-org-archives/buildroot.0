From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 06:43:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch disko
Message-ID: <cover.1311136895.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ffe62f915dcbf62a840b40167f391127f0702aac:

  sysvinit: package name typo (2011-07-12 09:11:39 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git disko

Thomas Petazzoni (3):
      scons: new package
      disko: new package
      disko-demos: new package

 package/multimedia/Config.in                       |    2 +
 package/multimedia/disko-demos/Config.in           |    8 ++
 .../disko-demos-1.8.0-fix-install-paths.patch      |   61 +++++++++++++++
 package/multimedia/disko-demos/disko-demos.mk      |   27 +++++++
 package/multimedia/disko/Config.in                 |   41 ++++++++++
 .../disko/disko-1.8.0-directfb-fix-errors.patch    |   82 ++++++++++++++++++++
 .../disko/disko-1.8.0-fixup-pkgconfig.patch        |   22 +++++
 package/multimedia/disko/disko.mk                  |   57 ++++++++++++++
 package/scons/scons.mk                             |   13 +++
 9 files changed, 313 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/disko-demos/Config.in
 create mode 100644 package/multimedia/disko-demos/disko-demos-1.8.0-fix-install-paths.patch
 create mode 100644 package/multimedia/disko-demos/disko-demos.mk
 create mode 100644 package/multimedia/disko/Config.in
 create mode 100644 package/multimedia/disko/disko-1.8.0-directfb-fix-errors.patch
 create mode 100644 package/multimedia/disko/disko-1.8.0-fixup-pkgconfig.patch
 create mode 100644 package/multimedia/disko/disko.mk
 create mode 100644 package/scons/scons.mk

Thanks,
-- 
Thomas Petazzoni
