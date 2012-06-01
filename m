From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 1 Jun 2012 18:02:07 +0200
Subject: [Buildroot] [PATCH] xavante: bump version to 2.2.1
Message-ID: <CAB0FRsvEUUa-1XiddiPvjC8qibeg6Tzk=+LAa2F3N6Sym4_3-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xavante/xavante.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index e6dd312..5eabd1e 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,7 +4,7 @@
 #
 #############################################################

-XAVANTE_VERSION = 2.2.0
+XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
 XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi

-- 
1.7.9.5
