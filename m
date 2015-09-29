From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:46:29 +0200
Subject: [Buildroot] [git commit] libssh: indentation cleanup in Config.in
Message-ID: <20150929174639.AA3AF81D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9eef3ab93eee745e72cc5ab28e4ca1def9e96f6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh/Config.in |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

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
