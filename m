From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jan 2021 11:37:38 +0100
Subject: [Buildroot] [git commit] package/python-mwclient: update help text
 in Config.in
Message-ID: <20210103101947.7E5BF81192@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=044546c9f38ccdec35cf8aaa8dd6fa65068ccfc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
