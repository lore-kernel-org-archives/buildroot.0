From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 15:17:10 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/rauc: fix URL of
 the signed tarball
Message-ID: <20201222140041.7E155813D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=523963d8f24fc125144f1282cbd59e5bb5ce69cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Reported-by: Yair Ben Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9b454387cdc60a69fc2bac8a24d0e2cf3c5ddb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 51f37f6cb8..d327122293 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.4.tar.xz.asc
+# https://github.com/rauc/rauc/releases/download/v1.4/rauc-1.4.tar.xz.asc
 sha256  85aabf214cd93a37f7ad0b3aaad89eb94facf0f3ebf6e2edca945acbca9b0967  rauc-1.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
