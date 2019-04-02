From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Apr 2019 22:28:38 +0200
Subject: [Buildroot] [git commit] package/libxml2: change download site to
 http
Message-ID: <20190402203017.E0834817EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16e5ec5475fbce69ab0794589807ad7f9c1c3d5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ftp is blocked on some (corporate) networks.

Signed-off-by: Nityananda Padhan <ntneitin@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 3b3714fff1..f4b4de090e 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION = 2.9.9
-LIBXML2_SITE = ftp://xmlsoft.org/libxml2
+LIBXML2_SITE = http://xmlsoft.org/sources
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
