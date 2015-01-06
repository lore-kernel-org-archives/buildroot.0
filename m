From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 22:01:46 +0100
Subject: [Buildroot] [git commit] elfutils: bump version to 0.161
Message-ID: <20150106210437.65F45801EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4038cbf2279ce0f04125fc1a2266f84ea8090070
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 0.161
- Remove the portability patch. We don't need to have it in Buildroot
  since it includes the version number so we can download it safely
  without having collisions between versions.
- Adapt the patches that need to be adapted.
- Rename patches to start from 0001.
- Update the hash value and add a new value for the portability patch.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-argp-support.patch => 0001-argp-support.patch} |   38 +-
 package/elfutils/0001-elfutils-portability.patch   | 1875 --------------------
 ...isable-progs.patch => 0002-disable-progs.patch} |   24 +-
 .../elfutils/{0004-fts.patch => 0003-fts.patch}    |   34 +-
 ...0005-disable-po.patch => 0004-disable-po.patch} |    0
 ...-make-werror-conditional-to-build-werror.patch} |    0
 ...0007-memcpy-def.patch => 0006-memcpy-def.patch} |    0
 package/elfutils/elfutils.hash                     |    3 +-
 package/elfutils/elfutils.mk                       |    3 +-
 9 files changed, 52 insertions(+), 1925 deletions(-)

Patch is too large, so refusing to show it
