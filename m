From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 18:52:04 +1000
Subject: [Buildroot] [PATCH v3 1/2] python: enable bz2 module for host build
In-Reply-To: <1344761525-532-1-git-send-email-net147@gmail.com>
References: <1344761525-532-1-git-send-email-net147@gmail.com>
Message-ID: <1344761525-532-2-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bz2 module is required for building some Python packages.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/python/python.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..7b314ab 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -27,7 +27,6 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-gdbm		\
 	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
 	--disable-ssl
 
 HOST_PYTHON_MAKE_ENV = \
-- 
1.7.11.3
