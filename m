From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Nov 2014 11:47:42 +0000
Subject: [Buildroot] [PATCH v4 0/2] elfutils: version bump
Message-ID: <1415706464-15288-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v3:
- Keep Thomas' s-o-b in their modified patches
- Add Yann's r-b in the second patch
- Add Yann's a-b in the first patch

Vicente Olivert Riera (2):
  elfutils: rename patches to follow the new name structure
  elfutils: bump version to 0.160

 ...isable-progs.patch => 0001-disable-progs.patch} |   51 ++++++-----
 package/elfutils/0002-argp-support.patch           |   93 ++++++++++++++++++++
 ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |   14 ++--
 .../{elfutils-04-fts.patch => 0004-fts.patch}      |   68 +++++++--------
 package/elfutils/0005-disable-po.patch             |   24 +++++
 ...y-make-werror-conditional-to-build-werror.patch |   24 +++++
 package/elfutils/elfutils-02-argp-support.patch    |   92 -------------------
 package/elfutils/elfutils-05-disable-po.patch      |   22 -----
 package/elfutils/elfutils.hash                     |    3 +
 package/elfutils/elfutils.mk                       |    6 +-
 10 files changed, 213 insertions(+), 184 deletions(-)
 rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (62%)
 create mode 100644 package/elfutils/0002-argp-support.patch
 rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (62%)
 rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (97%)
 create mode 100644 package/elfutils/0005-disable-po.patch
 create mode 100644 package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
 delete mode 100644 package/elfutils/elfutils-02-argp-support.patch
 delete mode 100644 package/elfutils/elfutils-05-disable-po.patch
 create mode 100644 package/elfutils/elfutils.hash
