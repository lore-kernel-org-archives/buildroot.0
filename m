From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:17 +0200
Subject: [Buildroot] [PATCH v2 30/30] arch: remove the BR2_GCC_TARGET_TUNE
	option
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-31-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_GCC_TARGET_TUNE option is now unused, so we can get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1126d43..d62d887 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -217,9 +217,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	string
 
-config BR2_GCC_TARGET_TUNE
-	string
-
 config BR2_GCC_TARGET_ARCH
 	string
 
-- 
2.0.0
