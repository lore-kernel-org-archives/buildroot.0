From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 22:59:00 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/snappy: fix typo
Message-ID: <20170904205601.D14E27FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6918f13762e96127189789b9c554600d0001c70b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 662b830dd702f085bc0473a469e893ec9e59149e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index fcbcd13..bad0ef0 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -17,7 +17,7 @@ SNAPPY_INSTALL_STAGING = YES
 SNAPPY_CONF_OPTS = --disable-gtest
 
 # libsnappy links with libstdc++. Some libstdc++/arch variants use
-# pthread symbols for internal locking if built with thead
+# pthread symbols for internal locking if built with thread
 # support. libstdc++ does not have a .pc file, and its .la file does
 # not mention -pthread.  So, static linkig to libstdc++ will fail if
 # -pthread is not explicity linked to. Only do that for static builds.
