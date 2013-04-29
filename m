From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 22:56:57 +0200
Subject: [Buildroot] [git commit] system: remove trailing tabs in Config.in
	file
Message-ID: <20130429205839.010A29B8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beea18a4d8d3569b4034246f3ce5bc9d95fc5641
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 1e4fff3..c0e4f4a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -18,14 +18,14 @@ choice
 	help
 	  Choose the password encoding scheme to use when Buildroot
 	  needs to encode a password (eg. the root password, below).
-	  
+
 	  Note: this is used at build-time, and *not* at runtime.
 
 config BR2_TARGET_GENERIC_PASSWD_DES
 	bool "des"
 	help
 	  Use standard 56-bit DES-based crypt(3) to encode passwords.
-	  
+
 	  Old, wildly available, but also the weakest, very susceptible to
 	  brute-force attacks.
 
@@ -33,7 +33,7 @@ config BR2_TARGET_GENERIC_PASSWD_MD5
 	bool "md5"
 	help
 	  Use MD5 to encode passwords.
-	  
+
 	  The default. Wildly available, and pretty good.
 	  Although pretty strong, MD5 is now an old hash function, and
 	  suffers from some weaknesses, which makes it susceptible to
@@ -43,7 +43,7 @@ config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
 	  Use SHA256 to encode passwords.
-	  
+
 	  Very strong, but not ubiquitous, although available in glibc
 	  for some time now. Choose only if you are sure your C library
 	  understands SHA256 passwords.
@@ -52,7 +52,7 @@ config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
 	help
 	  Use SHA512 to encode passwords.
-	  
+
 	  Extremely strong, but not ubiquitous, although available in glibc
 	  for some time now. Choose only if you are sure your C library
 	  understands SHA512 passwords.
@@ -178,17 +178,17 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	default ""
 	help
 	  Set the initial root password (in clear). It will be md5-encrypted.
-	  
+
 	  If set to empty (the default), then no root password will be set,
 	  and root will need no password to log in.
-	  
+
 	  WARNING! WARNING!
 	  Although pretty strong, MD5 is now an old hash function, and
 	  suffers from some weaknesses, which makes it susceptible to attacks.
 	  It is showing its age, so this root password should not be trusted
 	  to properly secure any product that can be shipped to the wide,
 	  hostile world.
-	  
+
 	  WARNING! WARNING!
 	  The password appears in clear in the .config file, and may appear
 	  in the build log! Avoid using a valuable password if either the
