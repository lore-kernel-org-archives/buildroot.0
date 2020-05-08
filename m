From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 09:58:36 +0200
Subject: [Buildroot] [git commit] package/apparmor: fix typo in Config.in
Message-ID: <20200508075218.DBEF990FCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebea009ffdd018f9615584e2e3be19d8c7325c82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pyhon should be python

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
