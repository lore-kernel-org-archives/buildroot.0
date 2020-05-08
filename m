From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 18:59:54 -0700
Subject: [Buildroot] [PATCH 3/5] package/apparmor: fix typo in Config.in
In-Reply-To: <20200508015956.3270405-1-aduskett@gmail.com>
References: <20200508015956.3270405-1-aduskett@gmail.com>
Message-ID: <20200508015956.3270405-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

pyhon should be python

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/apparmor/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
index 3cb5349cac..b0d2e44ff7 100644
--- a/package/apparmor/Config.in
+++ b/package/apparmor/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_APPARMOR_UTILS
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_READLINE
 	help
-	  A set of utilities (written in pyhon):
+	  A set of utilities (written in python):
 	    aa-audit          aa-disable      aa-logprof
 	    aa-autodep        aa-easyprof     aa-mergeprof
 	    aa-cleanprof      aa-enforce      aa-status
-- 
2.26.2
