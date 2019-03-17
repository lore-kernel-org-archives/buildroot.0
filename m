From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 18 Mar 2019 06:05:57 +0800
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: drop aiohttp
 dependency
Message-ID: <20190317220557.1359-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

aiohttp isn't a required dependency for aiojobs

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiojobs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
index 54d6c02a8e..ab61985164 100644
--- a/package/python-aiojobs/Config.in
+++ b/package/python-aiojobs/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_AIOJOBS
 	bool "python-aiojobs"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
 	help
 	  Jobs scheduler for managing background task (asyncio).
 
-- 
2.17.1
