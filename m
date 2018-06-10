From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 22:15:09 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/linphone: needs speexdsp
In-Reply-To: <20180610201509.30546-1-bernd.kuhls@t-online.de>
References: <20180610201509.30546-1-bernd.kuhls@t-online.de>
Message-ID: <20180610201509.30546-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/956/956b8cffa0a35a417763ad72bb7c8e8a8b2fe6b0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial revision

 package/linphone/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 2504ca2b49..06eb059cfd 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LINPHONE
 	depends on BR2_USE_MMU # libeXosip2
 	select BR2_PACKAGE_LIBEXOSIP2
 	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_SPEEXDSP
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
-- 
2.17.1
