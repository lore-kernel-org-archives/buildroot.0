From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:45 +0200
Subject: [Buildroot] [RFCv1 07/11] toolchain: intermediate .mk files no
	longer needed
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external.mk | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 toolchain/toolchain-external.mk

diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
deleted file mode 100644
index 2f43db7..0000000
--- a/toolchain/toolchain-external.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-# Required includes for the external toolchain backend
-
-include toolchain/helpers.mk
-include toolchain/toolchain-external/ext-tool.mk
-- 
1.8.1.2
