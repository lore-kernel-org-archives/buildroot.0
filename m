From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 May 2010 00:49:29 +0200
Subject: [Buildroot] [git commit master] dependencies: fix tests on
	LD_LIBRARY_PATH
Message-ID: <20100526225934.15FD612DEF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b8b829508a98667267b6a5ec8342ddd1f2b3377
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Things like LD_LIBRARY_PATH=. or even LD_LIBRARY_PATH=.:/usr/lib were
not detected as incorrect.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
