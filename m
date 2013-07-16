From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:03:25 +0200
Subject: [Buildroot] [PATCHv3 14/14] arch: use tabs instead of spaces in
	Config.in files
In-Reply-To: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373961805-3901-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in       | 2 +-
 arch/Config.in.avr32 | 4 ++--
 arch/Config.in.bfin  | 2 +-
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
-- 
1.8.1.2
