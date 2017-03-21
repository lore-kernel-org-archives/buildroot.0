From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:08:44 +0100
Subject: [Buildroot] [git commit] tslib: use main project page in Config.in
	help text
Message-ID: <20170321220924.0342E821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06e97ae8f8812a4b3f8f430480752bcb79cc8065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
[Thomas: instead of adding tslib.org, just replace the github address by
the tslib.org one, which is the really upstream homepage.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tslib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index bc5d790..f1de56c 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TSLIB
 	help
 	  Tslib is a filtering layer for touchscreen panel events.
 
-	  https://github.com/kergoth/tslib
+	  http://tslib.org
 
 comment "tslib needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
