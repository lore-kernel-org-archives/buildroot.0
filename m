From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 1 Jun 2012 18:01:21 +0200
Subject: [Buildroot] [PATCH] wsapi: bump version to 1.5
Message-ID: <CAB0FRss-T+_-3zm7RrDyUTF-bqV_KvURC9pPgTQDEeT_Pam-8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi/wsapi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f9ab334..cce7780 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,7 @@
 #
 #############################################################

-WSAPI_VERSION = 1.3.4
+WSAPI_VERSION = 1.5
 WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
 WSAPI_DEPENDENCIES = coxpcall luafilesystem rings

-- 
1.7.9.5
