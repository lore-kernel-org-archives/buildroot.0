From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu,  8 Jan 2015 11:49:28 +0100
Subject: [Buildroot] [PATCH 2/2] host-python: disable building ossaudiodev
	module
In-Reply-To: <1420714168-4994-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1420714168-4994-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1420714168-4994-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/python/python.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 45b1f7f..bf063e9 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -33,6 +33,7 @@ HOST_PYTHON_CONF_OPTS += 	\
 	--disable-test-modules	\
 	--disable-bz2		\
 	--disable-ssl		\
+	--disable-ossaudiodev	\
 	--disable-pyo-build
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
-- 
2.1.0
