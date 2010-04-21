From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Apr 2010 10:40:30 +0200
Subject: [Buildroot] [git commit master] external toolchains: take into
	account architecture variant
Message-ID: <20100421084100.DEC3620E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b7a4be0e1d59b9218b6145331c700ac8199e24e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, many TARGET_CFLAGS where missing when using an external
toolchain, due to how package/Makefile.in was written. Now, a lot more
definitions are common between the Buildroot toolchain case and the
external toolchain case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
