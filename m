From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] board: remove
	atstk1005_defconfig
Message-ID: <20101217160203.3DE248E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c874dea8a2b415f1c8f92e6a653999884bf3fa02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Neither the kernel nor U-Boot have support for a 1005 board, so let's
get rid of this board configuration, the corresponding target
skeleton, kernel and busybox configuration and device table.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
