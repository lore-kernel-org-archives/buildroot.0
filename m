From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:46:23 +0200
Subject: [Buildroot] [git commit] package/snappy: fix typo
Message-ID: <20170731184524.2409781F81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=662b830dd702f085bc0473a469e893ec9e59149e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snappy/snappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 2b1da8c..8105559 100644
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
