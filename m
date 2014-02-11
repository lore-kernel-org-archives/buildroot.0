From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Feb 2014 08:57:09 -0300
Subject: [Buildroot] [PATCHv2 4/4] samba: update description and rename
	patches
In-Reply-To: <1392119829-31535-1-git-send-email-gustavo@zacarias.com.ar>
References: <1392119829-31535-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1392119829-31535-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/Config.in                                             | 6 +++---
 ...x-smbd-libs-avahi.patch => samba-0001-fix-smbd-libs-avahi.patch} | 0
 .../samba/{samba-getaddrinfo.patch => samba-0002-getaddrinfo.patch} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename package/samba/{samba-fix-smbd-libs-avahi.patch => samba-0001-fix-smbd-libs-avahi.patch} (100%)
 rename package/samba/{samba-getaddrinfo.patch => samba-0002-getaddrinfo.patch} (100%)

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
-- 
1.8.3.2
