From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Mar 2011 22:31:44 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc/4.2.4: Remove
	libstdc++ uClibc locale patches
Message-ID: <20110311214931.1CB668C99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a1c305c8a7011305b326aca1ad350c3be5a6db11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These patches do not build with more recent versions of uClibc
going back as far as at least 2008. More recent compiler versions
seem to do fine without these patches, so lets remove them so
libstdc++ locale support will actually build for gcc 4.2.4.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
