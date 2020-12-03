From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2020 09:37:50 -0000
Subject: [Buildroot] [git commit] package/trousers: bump to version 0.3.15
Message-ID: <20201203092225.0A8488361A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=648c824ec26cf1fee86f15e4eb7dc537dd38a995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop third and fourth patches (already in version)
- Update indentation in hash file (two spaces)

https://sourceforge.net/p/trousers/trousers/ci/master/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tiple-security-issues-that-are-present-if.patch | 90 ----------------------
 .../0004-trousers-resolve-build-failure.patch      | 41 ----------
 package/trousers/trousers.hash                     | 10 +--
 package/trousers/trousers.mk                       |  5 +-
 4 files changed, 6 insertions(+), 140 deletions(-)

Patch is too large, so refusing to show it
