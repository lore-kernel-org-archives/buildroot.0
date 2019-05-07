From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:35 +0200
Subject: [Buildroot] [PATCH v1 15/28] package/mksh: replace utf-8 apostrophe
 by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-15-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mksh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/Config.in b/package/mksh/Config.in
index 55d1cc15ed..e6ccc90646 100644
--- a/package/mksh/Config.in
+++ b/package/mksh/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_MKSH
 	  secure shell not cut off modern extensions; a shell with
 	  Unicode support; an actively developed, current, and
 	  portable product; one with developers that listen to
-	  their users? requests and implement them if they
+	  their users' requests and implement them if they
 	  actually make sense.

 	  mksh aims to replace pdksh in all but very rare use cases
--
2.21.0
