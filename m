From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 28 Sep 2015 23:27:24 +0200
Subject: [Buildroot] [PATCH 4/4] libssh/Config.in:indentation cleanup
In-Reply-To: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1443475644-5320-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libssh/Config.in | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 719ca8c..e8ef602 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBSSH
-        bool "libssh"
-        depends on BR2_USE_MMU # fork()
-        # Either OpenSSL or libgcrypt are mandatory
-        select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
-        help
-          libssh is a multiplatform C library implementing the SSHv2
-          and SSHv1 protocol on client and server side. With libssh,
-          you can remotely execute programs, transfer files, use a
-          secure and transparent tunnel for your remote applications.
+	bool "libssh"
+	depends on BR2_USE_MMU # fork()
+	# Either OpenSSL or libgcrypt are mandatory
+	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	help
+	  libssh is a multiplatform C library implementing the SSHv2
+	  and SSHv1 protocol on client and server side. With libssh,
+	  you can remotely execute programs, transfer files, use a
+	  secure and transparent tunnel for your remote applications.
 
-          http://www.libssh.org/
+	  http://www.libssh.org/
-- 
1.9.1
