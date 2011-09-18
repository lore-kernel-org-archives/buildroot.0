From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2011 18:05:21 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/python-fix
Message-ID: <cover.1316361915.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 16d6e9b3420e78a89960b8b68202ea46a618810d:

  Makefile.autotools.in: fix autoreconf libtool patching after libtool move (2011-09-17 14:16:42 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/python-fix

Thomas Petazzoni (2):
      python: fix build by adding some more patches
      python: bump to 2.7.2

 .../python/python-2.7-001-support-for-build.patch  |   43 +++++-----
 .../python-2.7-002-cross-compile-variable.patch    |   18 ++--
 ...on-2.7-003-no-import-when-cross-compiling.patch |    6 +-
 .../python-2.7-004-no-host-headers-libs.patch      |   32 ++++++--
 .../python-2.7-005-staging-headers-libs.patch      |   10 +-
 .../python/python-2.7-006-disable-extensions.patch |   26 +++---
 .../python-2.7-007-do-not-generate-pyo-files.patch |    8 +-
 .../python/python-2.7-008-reread-environment.patch |   16 ++--
 package/python/python-2.7-009-python-symlink.patch |    8 +-
 ...python-2.7-010-change-pyconfig-h-location.patch |   24 +++---
 package/python/python-2.7-011-no-rpath.patch       |   14 ++--
 .../python-2.7-012-correct-32bit-64bit-check.patch |   10 +-
 .../python-2.7-013-fix-linux-3-compilation.patch   |   22 +++---
 .../python-2.7-014-verbose-module-build.patch      |   19 +++++
 ...7-015-distutils-cross-compilation-support.patch |   84 ++++++++++++++++++++
 .../python-2.7-100-optional-test-modules.patch     |   47 +++++------
 package/python/python-2.7-101-optional-pydoc.patch |   32 ++++----
 package/python/python-2.7-102-optional-2to3.patch  |   55 ++++++-------
 .../python/python-2.7-103-optional-sqlite.patch    |    8 +-
 package/python/python-2.7-104-optional-tk.patch    |   35 ++++----
 .../python/python-2.7-105-optional-curses.patch    |   20 +++---
 package/python/python-2.7-106-optional-expat.patch |   32 ++++----
 .../python-2.7-107-optional-codecs-cjk.patch       |    8 +-
 package/python/python-2.7-108-optional-nis.patch   |    8 +-
 .../python-2.7-109-optional-unicodedata.patch      |    8 +-
 package/python/python-2.7-110-optional-db.patch    |   37 +++++----
 package/python/python-2.7-111-optional-ssl.patch   |    8 +-
 package/python/python-2.7-112-optional-bzip2.patch |    8 +-
 package/python/python-2.7-113-optional-zlib.patch  |    8 +-
 package/python/python.mk                           |    2 +-
 30 files changed, 382 insertions(+), 274 deletions(-)
 create mode 100644 package/python/python-2.7-014-verbose-module-build.patch
 create mode 100644 package/python/python-2.7-015-distutils-cross-compilation-support.patch

Thanks,
-- 
Thomas Petazzoni
