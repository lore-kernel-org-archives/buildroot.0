From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Mar 2021 22:05:29 +0100
Subject: [Buildroot] [git commit] package/bash: bump version to 5.1
Message-ID: <20210311204416.E429B86248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e778b044c949d165207150cc9e79fdcfbafcb9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed 0001-bash50-001.patch to 0018-bash50-018.patch

- added 0001-bash51-001.patch, 0002-bash51-002.patch, 0003-bash51-003.patch,
  0004-bash51-004.patch

- moved 0019-input.h-add-missing-include-on-stdio.h.patch to
  0005-input.h-add-missing-include-on-stdio.h.patch

- removed 0020-locale.c-fix-build-without-wchar.patch
  (superseded by upstream commit)

- added 0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
  to fix typo from upstream commit (see previous patch)

- added 0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bash/0001-bash50-001.patch                 | 170 ------------
 package/bash/0001-bash51-001.patch                 |  83 ++++++
 package/bash/0002-bash50-002.patch                 | 117 --------
 package/bash/0002-bash51-002.patch                 |  60 +++++
 package/bash/0003-bash50-003.patch                 | 243 -----------------
 package/bash/0003-bash51-003.patch                 |  56 ++++
 package/bash/0004-bash50-004.patch                 |  57 ----
 package/bash/0004-bash51-004.patch                 | 129 +++++++++
 package/bash/0005-bash50-005.patch                 | 114 --------
 ...5-input.h-add-missing-include-on-stdio.h.patch} |   0
 package/bash/0006-bash50-006.patch                 |  51 ----
 ...typo-local_shiftstates-vs.-locale_shiftst.patch |  72 +++++
 package/bash/0007-bash50-007.patch                 |  66 -----
 ...ix-dequote_pathname-vs.-udequote_pathname.patch |  46 ++++
 package/bash/0008-bash50-008.patch                 |  72 -----
 package/bash/0009-bash50-009.patch                 |  46 ----
 package/bash/0010-bash50-010.patch                 | 176 -------------
 package/bash/0011-bash50-011.patch                 |  63 -----
 package/bash/0012-bash50-012.patch                 |  68 -----
 package/bash/0013-bash50-013.patch                 |  77 ------
 package/bash/0014-bash50-014.patch                 |  56 ----
 package/bash/0015-bash50-015.patch                 |  82 ------
 package/bash/0016-bash50-016.patch                 |  62 -----
 package/bash/0017-bash50-017.patch                 | 293 ---------------------
 package/bash/0018-bash50-018.patch                 |  49 ----
 .../0020-locale.c-fix-build-without-wchar.patch    |  84 ------
 package/bash/bash.hash                             |   6 +-
 package/bash/bash.mk                               |   2 +-
 28 files changed, 450 insertions(+), 1950 deletions(-)

Patch is too large, so refusing to show it
