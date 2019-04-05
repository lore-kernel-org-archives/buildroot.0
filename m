From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:40:39 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libxslt: change
 download site to http
Message-ID: <20190405153704.DC0BB8D785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b5cb1fd427906b071bb9ff5227d44fc31a5626b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

ftp is blocked on some (corporate) networks.

Signed-off-by: Nityananda Padhan <ntneitin@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 58ea5f583585e6ec42a3caa568f9fc931d632526)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxslt/libxslt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 5b1c0ae268..4632301b16 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXSLT_VERSION = 1.1.32
-LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
+LIBXSLT_SITE = http://xmlsoft.org/sources
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
