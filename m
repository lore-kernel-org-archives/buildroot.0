From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:07:14 +0200
Subject: [Buildroot] [git commit] package/python-keyring: fix syntax error
 in Config.in
Message-ID: <20191021190109.E40D3837BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=051c71f9991b4b9515518da941319a6b2726b862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-keyring/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 3961ee8b81..2dc990a50c 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
-	depends BR2_PACKAGE_PYTHON3 # python-secretstorage
+	depends on BR2_PACKAGE_PYTHON3 # python-secretstorage
 	depends on BR2_INSTALL_LIBSTDCPP # python-secretstorage
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
