From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Apr 2019 22:30:30 +0200
Subject: [Buildroot] [git commit] package/libxslt: change download site to
 http
Message-ID: <20190402203017.E8FF8817EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58ea5f583585e6ec42a3caa568f9fc931d632526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ftp is blocked on some (corporate) networks.

Signed-off-by: Nityananda Padhan <ntneitin@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
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
