From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Sep 2009 20:22:38 +0200
Subject: [Buildroot] [git commit master] package: Remove unnecessary
	dependencies on uclibc.
Message-ID: <20090903185705.83F5B7776A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=422ce6536b6d45e4632d526ae04c6af0bd36e80a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A C library will have been built by the toolchain makefiles, so there is no
need for packages to explicitly depend on uclibc.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
