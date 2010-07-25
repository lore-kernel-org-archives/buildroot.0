From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jul 2010 16:53:48 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	genautotargets-conversion
Message-ID: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 3435c1afb58307240be8e4607b5bb7d239fac4e9:
  Peter Korsgaard (1):
        kconfig: implement KCONFIG_PROBABILITY for rand{,package}config

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot genautotargets-conversion

Thomas Petazzoni (4):
      ltrace: convert to gentargets and bump to 0.5.3
      tftpd: convert to autotargets
      setserial: convert to autotargets and fix bug 2269
      Deprecate pcmcia and microwin packages

 package/ltrace/ltrace-0.5-00-susv3-legacy.patch    |   11 --
 package/ltrace/ltrace-0.5.3-configure-fixes.patch  |  128 ++++++++++++++++++++
 package/ltrace/ltrace-0.5.3-susv3-legacy.patch     |   20 +++
 package/ltrace/ltrace.mk                           |   90 ++++-----------
 package/microwin/Config.in                         |    2 +
 package/pcmcia/Config.in                           |    2 +
 .../setserial-2.17-build-system-fix.patch          |   28 +++++
 package/setserial/setserial.mk                     |   16 ++-
 package/tftpd/tftpd.mk                             |   83 ++-----------
 9 files changed, 220 insertions(+), 160 deletions(-)
 delete mode 100644 package/ltrace/ltrace-0.5-00-susv3-legacy.patch
 create mode 100644 package/ltrace/ltrace-0.5.3-configure-fixes.patch
 create mode 100644 package/ltrace/ltrace-0.5.3-susv3-legacy.patch
 create mode 100644 package/setserial/setserial-2.17-build-system-fix.patch

Thanks,
-- 
Thomas Petazzoni
