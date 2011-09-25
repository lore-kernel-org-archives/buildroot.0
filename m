From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 25 Sep 2011 20:36:52 +0200
Subject: [Buildroot] [git commit] taglib: bump to 1.7
Message-ID: <20110925184625.89A458D4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=945b5356faae24b6d474d370e16e543090ce2a44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the version of taglib to 1.7. This version does not any longer
ship with a configure script so convert the package from autotargets
to cmaketargets.

The 1.7 version offers optional support for MP4 and WMA files.
Expose these options in buildroot.

[Peter: drop unneded dependencies, keep target install, fix Config.in indent]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/taglib/Config.in                |    9 +
 package/multimedia/taglib/taglib-1.5-libtool.patch | 4084 --------------------
 package/multimedia/taglib/taglib.mk                |   16 +-
 3 files changed, 17 insertions(+), 4092 deletions(-)

Patch is too large, so refusing to show it
