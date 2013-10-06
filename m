From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:17 +0200
Subject: [Buildroot] [PATCHv2 07/21] toolchain: intermediate .mk files no
	longer needed
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 toolchain/toolchain-external.mk | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 toolchain/toolchain-external.mk

diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
deleted file mode 100644
index 2644689..0000000
--- a/toolchain/toolchain-external.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-# Required includes for the external toolchain backend
-
-include toolchain/toolchain-external/helpers.mk
-include toolchain/toolchain-external/ext-tool.mk
-- 
1.8.1.2
