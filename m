From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 21:00:28 +0100
Subject: [Buildroot] [git commit] xfsprogs: fix upstream submission link
Message-ID: <20180110200218.AAC1383BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=054a2f2e49ae1f69270e07d4a068179547a35388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The oss.sgi.com mailing list archives are no longer available, point
to spinics.net instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
index 4e4160f..2bb0b7d 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -10,7 +10,7 @@ linking for libuuid only. Otherwise the build will fail like this:
 ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Sent upstream: http://oss.sgi.com/pipermail/xfs/2015-November/045136.html]
+[Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
 ---
  mdrestore/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
