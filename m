From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] board: simplify kb9202 board
Message-ID: <20101217160201.E84408E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=630ba981a0b86e0931663191cf6dac5403e7056d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minimize the board defconfig, remove custom busybox configuration,
custom kernel configuration (use the kernel defconfig instead), custom
device table and target skeleton. The only difference in the target
skeleton was the support of mdev and the usage of an automount
script. Instead of adding this in a board-specific way, we should
provide board-independent configuration options. There are already
patches contributed to add support for mdev.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
