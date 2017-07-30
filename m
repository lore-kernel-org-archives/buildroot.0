From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jul 2017 16:47:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/snappy: fix typo
Message-ID: <20170730144731.8961-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/snappy/snappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 2b1da8cf5..81055594c 100644
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
-- 
2.11.0
