From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:27 +0200
Subject: [Buildroot] [git commit] gcc: remove Blackfin patches
Message-ID: <20180415200629.468BE886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=177a2a8076b91b4c438ef364fde6a8f8b58b4e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...bgcc-mkmap-symver-support-skip_underscore.patch |   60 -
 ...ig-bfin-use-the-generic-linker-version-in.patch | 1944 --------------------
 ...-fix-DWARF-compilation-with-FDPIC-targets.patch |   59 -
 package/gcc/6.4.0/895-bfin-define-REENTRANT.patch  |   17 -
 4 files changed, 2080 deletions(-)

Patch is too large, so refusing to show it
