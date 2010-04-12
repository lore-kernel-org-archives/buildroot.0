From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:12 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	autotools-conversion
Message-ID: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 04ba0089a672863e333a2de6b19d9b77fd0b26c1:
  Thomas Petazzoni (1):
        Get rid of the OPTIMIZE_FOR_CPU variable

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot autotools-conversion

Thomas Petazzoni (21):
      vtun: convert to the autotools infrastructure
      x11vnc: cleanup useless config options
      udpcast: convert to the autotools infrastructure
      setserial: convert to the autotools infrastructure
      smartmontools: convert to the autotools infrastructure
      patch: convert to the autotools infrastructure and bump version
      libosip2: convert to the autotools infrastructure
      libcgicc: convert to the autotools infrastructure
      libraw1394: convert to the autotools infrastructure
      libsysfs: convert to the autotools infrastructure
      libcgi: convert to the autotools infrastructure
      Remove incorrect 'dummy' example
      bison: convert to the autotools infrastructure
      tar: convert to the autotools infrastructure
      argus: convert to the autotools infrastructure
      ipkg: remove useless configure options
      findutils: convert to the autotools infrastructure
      madplay: convert to the autotools infrastructure
      aumix: convert to the autotools infrastructure
      libmad: convert to the autotools infrastructure
      libid3tag: convert to the autotools infrastructure

 package/argus/argus.mk                             |   64 ++------------
 package/bison/bison.mk                             |   69 +--------------
 package/dummy/Config.in                            |    7 --
 package/dummy/dummy.mk                             |   93 --------------------
 package/findutils/findutils.mk                     |   75 +----------------
 package/ipkg/ipkg.mk                               |    3 -
 package/libcgi/libcgi.mk                           |   68 +--------------
 package/libcgicc/libcgicc.mk                       |   64 +------------
 package/libosip2/libosip2.mk                       |   83 ++----------------
 package/libraw1394/libraw1394.mk                   |   64 +-------------
 package/libsysfs/libsysfs.mk                       |   59 +------------
 .../aumix-2.8-fix-incorrect-makefile-am.patch      |   29 ++++++
 package/multimedia/aumix/aumix.mk                  |   60 ++-----------
 package/multimedia/libid3tag/libid3tag.mk          |   62 +------------
 package/multimedia/libmad/libmad.mk                |   77 ++--------------
 package/multimedia/madplay/madplay.mk              |   64 +------------
 package/patch/patch.mk                             |   69 +--------------
 package/setserial/setserial.mk                     |   73 ++--------------
 package/smartmontools/smartmontools.mk             |   69 +--------------
 package/tar/tar.mk                                 |   82 +----------------
 package/udpcast/udpcast.mk                         |   93 +++-----------------
 package/vtun/vtun.mk                               |   76 +---------------
 package/x11vnc/x11vnc.mk                           |    7 +-
 23 files changed, 127 insertions(+), 1283 deletions(-)
 delete mode 100644 package/dummy/Config.in
 delete mode 100644 package/dummy/dummy.mk
 create mode 100644 package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch

Thanks,
-- 
Thomas Petazzoni
