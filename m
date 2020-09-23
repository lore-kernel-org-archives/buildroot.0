From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:57:07 +0200
Subject: [Buildroot] [git commit] package/python-sentry-sdk: update homepage
 URL
Message-ID: <20200923204731.C84C98DA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd87db1d657a02c2016ef3d9730d943f3910d861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sentry-sdk/Config.in b/package/python-sentry-sdk/Config.in
index 62b8100bdb..e8e88bac18 100644
--- a/package/python-sentry-sdk/Config.in
+++ b/package/python-sentry-sdk/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PYTHON_SENTRY_SDK
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	help
-	  Python client for Sentry (https://getsentry.com).
+	  Python client for Sentry (https://sentry.io).
 
 	  https://github.com/getsentry/sentry-python
