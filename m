From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  2 Nov 2018 10:53:39 +0200
Subject: [Buildroot] [PATCH 1/1] python-cython: write full package name on
 .mk title.
Message-ID: <20181102085341.29421-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Renamed 'cython' to 'python-cython'.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cython/python-cython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 624fe2fb75..f4cff975f1 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# cython
+# python-cython
 #
 ################################################################################
 
-- 
2.19.1
