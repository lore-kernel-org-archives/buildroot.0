From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:50:41 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp: add missing zlib
 dependency
Message-ID: <20181206204703.8D7DE87069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01b9bdf13e2e97d2e2a8b8225bfc44fd57d022c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 81862c9bba..d75c440225 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_YARL # runtime
 	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Async http client/server framework (asyncio).
 
