From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 09:23:06 +0100
Subject: [Buildroot] [git commit] package/flac: fix patch file extension
Message-ID: <20141203082334.AC7EE8007B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce49c7c852d74a24967e491db10d9135a1fd6b70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.org/results/c22/c22f29fd787a3d12d86cc3cd3e2d9c8688d2f65d/
  http://autobuild.buildroot.org/results/1f8/1f824e3aa17fb17e7efe3e4c1636974fea79c1f9/
  http://autobuild.buildroot.org/results/8ad/8ad965fbc19e22d3f43899cb5efb42626fa2f55e/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure-don-t-try-to-unset-g-from-CFLAGS.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
similarity index 100%
rename from package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt
rename to package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
