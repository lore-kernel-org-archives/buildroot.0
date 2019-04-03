From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Apr 2019 22:15:44 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: drop package/lunit reference
Message-ID: <20190403201204.5E0DE7FD96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0049eca6f4632ceae45dcd8ed9180ad00b596793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package has been removed, get-developers complains:

WARNING: 'package/lunit/' doesn't match any file

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1001d55815..4ffb473487 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -863,7 +863,6 @@ F:	package/lpty/
 F:	package/lrandom/
 F:	package/lsqlite3/
 F:	package/lua*
-F:	package/lunit/
 F:	package/lzlib/
 F:	package/moarvm/
 F:	package/netsurf/
