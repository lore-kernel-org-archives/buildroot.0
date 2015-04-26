From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:17:02 +0200
Subject: [Buildroot] [git commit] package/dovecot: Fix broken logic for
	comment display
Message-ID: <20150426102027.AD29D80386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1814da768bc29e8c23c5b2977e2a999d1480115e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 9c242fc..3baae6e 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -55,4 +55,4 @@ endif # BR2_PACKAGE_DOVECOT
 
 comment "dovecot needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
