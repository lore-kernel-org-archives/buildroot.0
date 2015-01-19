From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jan 2015 00:32:10 +0100
Subject: [Buildroot] [git commit] radvd: add license info
Message-ID: <20150119234523.2F9707FF0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ab5cbb4bda30d6eb7e4f73ee1197401aeb419e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's BSD-4c with a few extras, so BSD-4c-like.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 6b241b7..4daf9d7 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -11,6 +11,8 @@ RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # We're patching configure.ac/Makefile.am.
 RADVD_AUTORECONF = YES
+RADVD_LICENSE = BSD-4c-like
+RADVD_LICENSE_FILES = COPYRIGHT
 
 define RADVD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d/S50radvd
