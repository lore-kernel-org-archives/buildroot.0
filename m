From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] board: add support for Mini 2440
Message-ID: <20101217160204.60F1C8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd2167d504929c99031b92590dac41426ca635f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Paul Jones documented at
http://pauljones.id.au/blog/2010/07/using-buildroot-on-a-mini2440/ how
to use Buildroot to generate a system for the FriendlyARM Mini2440
platform. This patch integrates Paul's work into Buildroot.

Unfortunately, the kernel being 2.6.32, we can't easily use a minimal
defconfig here. The mini2440 support has been merged into more recent
kernels, but I don't have the hardware to test.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
