From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Mar 2010 23:19:57 +0100
Subject: [Buildroot] [git commit master] toolchain: Add uClibc 0.9.30.3,
	remove older 0.9.30.x
Message-ID: <20100312225107.E70057758B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de859f6b2ac8660113e15aff6bc394a441dda60e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the 0.9.30.x stable releases only contain bugfixes, there isn't much
sense in using the older 0.9.30.x releases instead of .3, so use a single
0.9.30.x config similar to how we do it for the kernel headers.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
