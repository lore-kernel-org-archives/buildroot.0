From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:28:11 +0200
Subject: [Buildroot] [git commit] package/linphone: needs speexdsp
Message-ID: <20180616122621.598618808A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af4e09769d2f74ca4a6bbcb688374c717fb11913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/956/956b8cffa0a35a417763ad72bb7c8e8a8b2fe6b0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
 
