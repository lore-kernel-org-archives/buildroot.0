From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Nov 2014 11:00:35 +0000
Subject: [Buildroot] [PATCH v3 0/2] *** SUBJECT HERE ***
Message-ID: <1415703637-11831-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v2:
- Join patches 2, 3 and 4 in a single patch, so all the patch series 
  works at each point of the series.

Vicente Olivert Riera (2):
  elfutils: rename patches to follow the new name structure
  elfutils: bump version to 0.160

 ...isable-progs.patch => 0001-disable-progs.patch} |   54 ++++++------
 package/elfutils/0002-argp-support.patch           |   92 ++++++++++++++++++++
 ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |   15 ++--
 .../{elfutils-04-fts.patch => 0004-fts.patch}      |   69 +++++++--------
 package/elfutils/0005-disable-po.patch             |   23 +++++
 ...y-make-werror-conditional-to-build-werror.patch |   24 +++++
 package/elfutils/elfutils-02-argp-support.patch    |   92 --------------------
 package/elfutils/elfutils-05-disable-po.patch      |   22 -----
 package/elfutils/elfutils.hash                     |    3 +
 package/elfutils/elfutils.mk                       |    6 +-
 10 files changed, 212 insertions(+), 188 deletions(-)
 rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (60%)
 create mode 100644 package/elfutils/0002-argp-support.patch
 rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (58%)
 rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (97%)
 create mode 100644 package/elfutils/0005-disable-po.patch
 create mode 100644 package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
 delete mode 100644 package/elfutils/elfutils-02-argp-support.patch
 delete mode 100644 package/elfutils/elfutils-05-disable-po.patch
 create mode 100644 package/elfutils/elfutils.hash
