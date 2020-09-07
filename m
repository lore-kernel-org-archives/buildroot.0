From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 08:49:56 +0200
Subject: [Buildroot] [git commit] package/python-opcua-asyncio: sort selects
 alphabetically
Message-ID: <20200907064159.90CBE82DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae3c887a9911cbc2671fb24ee71bdaa6468b4fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-opcua-asyncio/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index 6dee004b9b..3700e00e1d 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_DATEUTIL #runtime
-	select BR2_PACKAGE_PYTHON_PYTZ #runtime
-	select BR2_PACKAGE_PYTHON_LXML #runtime
-	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY #runtime
-	select BR2_PACKAGE_PYTHON_AIOFILES #runtime
+	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_LXML # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  opcua-asyncio is an asyncio-based asynchronous
 	  OPC UA client based on python-opcua, removing
