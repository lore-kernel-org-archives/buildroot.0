From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:50:44 +0200
Subject: [Buildroot] [git commit] package/enlightenment: set eldbus-codegen
	path
Message-ID: <20160906195112.43A5A82263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0bbbe5c9ed8564965101b5980b04ec8ba2e5432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the one from the host may be used.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/enlightenment.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index a86fb86..d77421f 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -19,6 +19,7 @@ ENLIGHTENMENT_DEPENDENCIES = \
 ENLIGHTENMENT_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
 	--disable-pam \
 	--disable-rpath
 
