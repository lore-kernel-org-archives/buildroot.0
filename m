From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Feb 2011 13:23:43 +0100
Subject: [Buildroot] [git commit master 1/1] taglib: fix build
Message-ID: <20110218124123.BD9E08F5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f357e10335c51879007da3410c676866cf0e91c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old libtool version gets confused about rpath, which breaks the build.
FIx it by up upgrading to 1.5.22 (package is not compatible with libtool
2.x, so we cannot just autoreconf).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
