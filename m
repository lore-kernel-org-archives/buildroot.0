From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 02:25:30 +0100
Subject: [Buildroot] [PATCH 1/7] Update for 2015.11.1
In-Reply-To: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454289936-10654-2-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 CHANGES | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/CHANGES b/CHANGES
index 336b195..7b7797c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2015.11.1, Released December 5th, 2015
+
+	Fix for issue with the host package RPATH check when a custom host
+	directory (BR2_HOST_DIR=/path/to/somewhere) is used.
+
+	Important (and/or security related) bugfixes for busybox,
+	dropbear, libpng and openssl.
+
+	Updated/fixed packages: busybox, dropbear, gawk, libpng, openssl
+
 2015.11, Released November 30th, 2015
 
 	Minor fixes.
-- 
2.1.4
