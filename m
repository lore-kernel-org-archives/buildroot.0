From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Oct 2009 21:40:05 +0200
Subject: [Buildroot] [git commit master] buildroot: silence ./configure step
	when building with 'make -s'
Message-ID: <20091001194037.E2323777AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3fdf0bffb87c81f6abf70e64e5b9239431d79ee2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have been passing -q to ./configure when using 'make -s' for
packages using Makefile.autotools.in for some time. Do the same
for packages using autotools, but not using the
Makefile.autotools.in infrastructure, taking care to not do it
for packages with hand written configure scripts.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
