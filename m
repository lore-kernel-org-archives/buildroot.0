From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 18:58:28 +0200
Subject: [Buildroot] [git commit] package/aircrack-ng: add missing space to
	LIBSQL
Message-ID: <20141025165835.6C2DCAF40B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=283bc5e97c46c12c409f4c93955919a066932906
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aircrack-ng/aircrack-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 720c144..b72506d 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -13,7 +13,7 @@ AIRCRACK_NG_DEPENDENCIES = openssl
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 	AIRCRACK_NG_MAKE_OPTS += \
-		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB),-lpthread)"
+		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -lpthread)"
 
 	AIRCRACK_NG_DEPENDENCIES += sqlite
 else
