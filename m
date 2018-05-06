From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 May 2018 11:36:24 +0200
Subject: [Buildroot] [PATCH 1/1] libmemcached: add hash for license file
Message-ID: <20180506093624.24923-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmemcached/libmemcached.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmemcached/libmemcached.hash b/package/libmemcached/libmemcached.hash
index 85df58f01e..77d7c478bc 100644
--- a/package/libmemcached/libmemcached.hash
+++ b/package/libmemcached/libmemcached.hash
@@ -1,2 +1,5 @@
 # From https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz/+md5
 md5	b3958716b4e53ddc5992e6c49d97e819	libmemcached-1.0.18.tar.gz
+
+# Hash for license file:
+sha256	4e9032d0f539276db05519ee3d09ca6167d2134ec91c556e8c80ef3efe633fd2	COPYING
-- 
2.14.1
