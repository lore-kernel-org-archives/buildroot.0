From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 23:28:26 +0200
Subject: [Buildroot] [git commit master] makedevs: move to package/
Message-ID: <20100419213703.A99392646F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5faae4869027d86cba895bf88b5b956c62310d30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since target/ doesn't contain any .mk file in subdirectories, also
remove the include in target/Makefile.in.

Patch is too large, so refusing to show it
