From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:53:11 +0100
Subject: [Buildroot] [git commit] xvkbd: remove version from the patch file
	name
Message-ID: <20130112215439.BA27D9990C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca170e06fbb130b821e9cf705c5afdc20208a1da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version in xvkbd patch file name doesn't patch the version of the
package, so use the new convention that consists in not having the
package version in the patch file names.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...kbd-2.8-makefile.patch => xvkbd-makefile.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
