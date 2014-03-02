From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 15:20:40 +0100
Subject: [Buildroot] [git commit] samba: update description and rename
	patches
Message-ID: <20140302142224.0B3FC9936E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80ad06e51c24199e15614a6a7c89e06c7fca44c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/Config.in                            |    6 +++---
 ....patch => samba-0001-fix-smbd-libs-avahi.patch} |    0
 ...addrinfo.patch => samba-0002-getaddrinfo.patch} |    0
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 1469075..c5b7e48 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_SAMBA
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_POPT
 	help
-	  Provides print services to all manner of SMB/CIFS clients,
-	  including the numerous versions of Microsoft Windows
-	  operating systems.
+	  Provides secure, stable and fast file and print services
+	  for all clients using the SMB/CIFS protocol, such as all
+	  versions of DOS, Windows, OS/2, Linux and many others.
 
 	  http://www.samba.org/
 
diff --git a/package/samba/samba-fix-smbd-libs-avahi.patch b/package/samba/samba-0001-fix-smbd-libs-avahi.patch
similarity index 100%
rename from package/samba/samba-fix-smbd-libs-avahi.patch
rename to package/samba/samba-0001-fix-smbd-libs-avahi.patch
diff --git a/package/samba/samba-getaddrinfo.patch b/package/samba/samba-0002-getaddrinfo.patch
similarity index 100%
rename from package/samba/samba-getaddrinfo.patch
rename to package/samba/samba-0002-getaddrinfo.patch
