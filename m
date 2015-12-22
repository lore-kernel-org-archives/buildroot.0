From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 18:00:44 +0100
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20151222170056.8E994826B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b36d4d964d0a30fd848e5804ef28ad8f500ba8df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index a61da08..f8c23c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -848,8 +848,8 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
-	source "package/libexif/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
+	source "package/libexif/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeglut/Config.in"
