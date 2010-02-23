From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] automake: add build dependency on
	host-autoconf
Message-ID: <20100223202920.C4F91776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f03faaf3ab5bbd5f375c47c3cf12f1254d1237bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

automake for the target fails to build if autoconf is not installed on
the host:

checking whether autoconf is installed... no
configure: error: Autoconf 2.58 or better is required.
    Please make sure it is installed and in your PATH.
make: *** [/home/test/brbuilttest/build/automake-1.10/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
