From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 11:21:06 -0800
Subject: [Buildroot] [git commit] package: add gd package
Message-ID: <20121203145712.675FD99808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0a13821d7f6ceb34061014b9899eb81c3988ccf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/gd/Config.in           |   62 ++++++++++++++++++++++++++++
 package/gd/gd-fontconfig.patch |   28 +++++++++++++
 package/gd/gd-maxcolors.patch  |   20 +++++++++
 package/gd/gd-no-zlib.patch    |   51 +++++++++++++++++++++++
 package/gd/gd.mk               |   87 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 249 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
