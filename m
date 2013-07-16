From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:32:31 +0200
Subject: [Buildroot] [git commit] arch: use tabs instead of spaces in
	Config.in files
Message-ID: <20130716140823.7220C9A079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8211ee3c596fe6f8338110b1d94e600b67ce5e17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in       |    2 +-
 arch/Config.in.avr32 |    4 ++--
 arch/Config.in.bfin  |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index c2147a4..0b5b218 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -1,5 +1,5 @@
 config BR2_ARCH_IS_64
-       bool
+	bool
 
 config BR2_SOFT_FLOAT
 	bool
diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index ebf8454..199c150 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -1,5 +1,5 @@
 config BR2_ARCH
-       default "avr32"
+	default "avr32"
 
 config BR2_ENDIAN
-       default "BIG"
+	default "BIG"
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index f755c8d..415fc89 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -66,7 +66,7 @@ config BR2_ARCH
 	default "bfin"
 
 config BR2_ENDIAN
-        default "LITTLE"
+	default "LITTLE"
 
 config BR2_GCC_TARGET_CPU
 	default bf606		if BR2_bf606
