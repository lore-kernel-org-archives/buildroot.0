From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:12:36 +0200
Subject: [Buildroot] [git commit] package/rauc: fix URL of the signed tarball
Message-ID: <20200813210642.569F28289B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b454387cdc60a69fc2bac8a24d0e2cf3c5ddb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Yair Ben Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
