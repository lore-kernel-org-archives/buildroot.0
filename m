From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 13 Apr 2011 13:29:25 -0300
Subject: [Buildroot] [PATCH 4/8] toolchain: update uClibc snapshot config to
	avoid build stalls
In-Reply-To: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
References: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1302712169-28385-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uClibc-snapshot.config |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 9c83d68..aa00680 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -28,6 +28,7 @@
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
 # TARGET_xtensa is not set
+# TARGET_c6x is not set
 
 # CONFIG_GENERIC_ARM is not set
 # CONFIG_ARM610 is not set
@@ -109,6 +110,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 UCLIBC_SUSV3_LEGACY=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_SUSV4_LEGACY=y
+# UCLIBC_STRICT_HEADERS is not set
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-- 
1.7.3.4
