From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed,  5 Dec 2018 15:07:01 +0800
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: add missing zlib
 dependency
Message-ID: <1543993621-17858-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 81862c9..d75c440 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_YARL # runtime
 	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Async http client/server framework (asyncio).
 
-- 
2.7.4
