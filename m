From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 21:08:11 +0200
Subject: [Buildroot] [git commit] package/micropython: fix license hash
Message-ID: <20200915190006.3CD578865F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79f8bfbb766c9040fc8f980580b3dabbd687069a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7676191cfacbdb1a92af1d0218d3280207b03090 forgot to update
license hash which changed due to an update in year:
https://github.com/micropython/micropython/commit/338b12d3c840ea56504c83d9c51e4d0f628684f4

While at it, also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/2a650636965d8575374333f847acc169caf8d2ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 4ca3f8402f..5dfbb74522 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256 31466dacebeb3af60dc80a071a07c3e15b657219a826e0b6ac741f9f22472f23  micropython-1.13.tar.gz
-sha256 afde3432122205e8e08d615fcb920aca58631c52b6c0c01813854287a457b298  LICENSE
+sha256  31466dacebeb3af60dc80a071a07c3e15b657219a826e0b6ac741f9f22472f23  micropython-1.13.tar.gz
+sha256  4b8a8884a60cd72749f9ef40328b85b40d13c22594c01352e0a55392141e0f89  LICENSE
