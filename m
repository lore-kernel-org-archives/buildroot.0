From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:13 +0200
Subject: [Buildroot] [PATCH 20/20] GETPT support is needed by rxvt.
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d0169fda2144ef5dfe25e801d58a227ed119a38c.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Darius Augulis <augulis.darius@gmail.com>

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 toolchain/uClibc/uClibc-0.9.30.config |    2 +-
 toolchain/uClibc/uClibc-0.9.31.config |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.30.config b/toolchain/uClibc/uClibc-0.9.30.config
index c8efe18..2202b9e 100644
--- a/toolchain/uClibc/uClibc-0.9.30.config
+++ b/toolchain/uClibc/uClibc-0.9.30.config
@@ -87,7 +87,7 @@ UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
-# UCLIBC_HAS_GETPT is not set
+UCLIBC_HAS_GETPT=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 04d6895..60b4628 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -94,7 +94,7 @@ UCLIBC_HAS_SHADOW=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
-# UCLIBC_HAS_GETPT is not set
+UCLIBC_HAS_GETPT=y
 UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
-- 
1.7.0.4
