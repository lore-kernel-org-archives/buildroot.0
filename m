From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 22:21:50 +0100
Subject: [Buildroot] [git commit] p11-kit: bump to version 0.20.7
Message-ID: <20150310221045.677997F9C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f57423064ef0c22717db370d126bff832e7e1fd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p11-kit/p11-kit.hash |    2 ++
 package/p11-kit/p11-kit.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
new file mode 100644
index 0000000..955b890
--- /dev/null
+++ b/package/p11-kit/p11-kit.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	68405492fe466b33927d461302aa98e703db3b8a596411585508bc33084484d2	p11-kit-0.20.7.tar.gz
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index ef4625d..d661c1f 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.20.6
+P11_KIT_VERSION = 0.20.7
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
 P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
