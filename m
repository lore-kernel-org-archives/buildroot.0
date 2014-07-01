From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:22:50 +0200
Subject: [Buildroot] [git commit] giblib: add license information
Message-ID: <20140701224921.96BA69D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23b7c6e96bb3648ad48bfea40b2549961123ca71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giblib/giblib.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 6d1ebb8..c4caf27 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -12,5 +12,7 @@ GIBLIB_AUTORECONF = YES
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 GIBLIB_CONFIG_SCRIPTS = giblib-config
+GIBLIB_LICENSE = MIT
+GIBLIB_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
