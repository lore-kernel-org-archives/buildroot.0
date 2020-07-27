From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 16:12:50 +0200
Subject: [Buildroot] [git commit] package/rocksdb: bump to version 6.10.1
Message-ID: <20200727141951.EC9CA8026F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef236e227181cc1b7906786a41743f2cfa41c741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation of hash file (two spaces)
- Remove first patch (already in version)
- Add link to upstream PR in second patch
- Add upstream patch to fix build on powerpc (patch does not apply
  cleanly on current version)
- Update hash of README.md, slack forum added with
  https://github.com/facebook/rocksdb/commit/cf342464caf8155ab60f7a48e39a8d6ae3138a7a

Fixes:
 - http://autobuild.buildroot.org/results/242db7139ce5dd6ece4a1eb50a1aa47c841a41b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rocksdb/0001-Check-for-sys-auxv.h.patch    |  111 -
 ..._tools-build_detect_platform-fix-C-tests.patch} |    1 +
 ...eplace-POWER-crc32c-with-C-implementation.patch | 4058 ++++++++++++++++++++
 package/rocksdb/rocksdb.hash                       |   10 +-
 package/rocksdb/rocksdb.mk                         |    2 +-
 5 files changed, 4065 insertions(+), 117 deletions(-)

Patch is too large, so refusing to show it
