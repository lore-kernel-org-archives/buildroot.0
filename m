From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 13:59:44 +0200
Subject: [Buildroot] Buildroot 2013.08.1 released
Message-ID: <87d2o7fykv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2013.08.1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.08.1.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.08.1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2013.08.1 is a bugfix release, fixing critical issues
discovered since the 2013.08 release.

See the changes file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08.1

Many thanks to all the people contributing to this release:

Axel Lin (1):
      Config.in: Fixup after BR2_ELF2FLT got renamed to BR2_PACKAGE_HOST_ELF2FLT

Martin Creutziger (1):
      ti-gfx.mk: correct typo

Peter Korsgaard (2):
      Update for 2013.08.1
      Makefile: release: create tarball from current branch, not master

Samuel Martin (1):
      legacy: marked BR2_PACKAGE_GCC_TARGET and BR2_HAVE_DEVFILES as removed

Thomas Petazzoni (1):
      Makefile: make $(BUILD_DIR)/.root rule idempotent

-- 
Bye, Peter Korsgaard
