From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:12:10 +0200
Subject: [Buildroot] [git commit] package/xvkbd: bump to version 4.0
Message-ID: <20191007210751.6AC618B33B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c23d0d8b7f572f97f380726f78bf5f4d52701260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of README: lots of updates (year, changelog, ...)
- Drop patch and switch to autotools infrastructure to use the new
  configure script added in this release
- Add patch to fix install

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-am-fix-install-data-hook.patch   |   27 +
 package/xvkbd/0001-makefile.patch                  | 2400 --------------------
 package/xvkbd/xvkbd.hash                           |    4 +-
 package/xvkbd/xvkbd.mk                             |   17 +-
 4 files changed, 33 insertions(+), 2415 deletions(-)

Patch is too large, so refusing to show it
