From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jan 2021 10:42:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-mwclient: update help text
 in Config.in
In-Reply-To: <20210103094219.5242-1-bernd.kuhls@t-online.de>
References: <20210103094219.5242-1-bernd.kuhls@t-online.de>
Message-ID: <20210103094219.5242-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-mwclient/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
index 76bf794892..dc93e6c0df 100644
--- a/package/python-mwclient/Config.in
+++ b/package/python-mwclient/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PYTHON_MWCLIENT
 	select BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
-	  MediaWiki API client.
+	  Python client library to interface with the MediaWiki API
 
-	  https://github.com/btongminh/mwclient
+	  https://github.com/mwclient/mwclient
-- 
2.29.2
