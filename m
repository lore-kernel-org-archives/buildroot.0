From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 21 Sep 2016 20:18:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-psutils: fix typo in
	Config.in
In-Reply-To: <20160921181838.4921-1-s.martin49@gmail.com>
References: <20160921181838.4921-1-s.martin49@gmail.com>
Message-ID: <20160921181838.4921-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python-psutil/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
index 0b1333c..1aec35d 100644
--- a/package/python-psutil/Config.in
+++ b/package/python-psutil/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PSUTIL
 	  https://pypi.python.org/pypi/psutil
 
 comment "python-psutil needs a uClibc or glibc toolchain"
-	depends BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.10.0
