From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Mar 2015 17:29:41 -0300
Subject: [Buildroot] [PATCH 2/2] p11-kit: bump to version 0.20.7
In-Reply-To: <1426019381-16061-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426019381-16061-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426019381-16061-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/p11-kit/p11-kit.hash | 2 ++
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/p11-kit/p11-kit.hash

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
-- 
2.0.5
