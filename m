From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:08:17 +0200
Subject: [Buildroot] [git commit] package/genext2fs: bump to version 1.5.0
Message-ID: <20210415185143.6AB89804AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51d55fc132372213c458372d226e6b562d2a6c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Retrieve latest version from github
- Drop patch (already in version)

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13741

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-update-genext2fs.c-to-rev-1.118.patch     | 2971 --------------------
 package/genext2fs/genext2fs.hash                   |    2 +-
 package/genext2fs/genext2fs.mk                     |    6 +-
 3 files changed, 5 insertions(+), 2974 deletions(-)

Patch is too large, so refusing to show it
