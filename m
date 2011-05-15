From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2011 22:29:02 +0200
Subject: [Buildroot] [git commit] uClibc: remove AVR32 patches for 0.9.29
Message-ID: <20110515204134.BE0E3834E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=80830a198ea80c2afd9f06b1b9bdaba23956e93a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0.9.29 version of uClibc can no longer be selected on AVR32 since
December 2009 (b642f7eefbf8c7f0111d74528390de31aaacf203). Therefore,
those two patches are now completely useless.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
