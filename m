From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:20 +0100
Subject: [Buildroot] [PATCH 01/12] sh: add /dev/ttyASx console devices
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 target/generic/Config.in |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 54ff1d6..f5d8286 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -45,6 +45,18 @@ config BR2_TARGET_GENERIC_GETTY_TTYAMA2
 config BR2_TARGET_GENERIC_GETTY_TTYAMA3
 	bool "ttyAMA3"
 	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYAS0
+	bool "ttyAS0"
+	depends on BR2_sh
+config BR2_TARGET_GENERIC_GETTY_TTYAS1
+	bool "ttyAS1"
+	depends on BR2_sh
+config BR2_TARGET_GENERIC_GETTY_TTYAS2
+	bool "ttyAS2"
+	depends on BR2_sh
+config BR2_TARGET_GENERIC_GETTY_TTYAS3
+	bool "ttyAS3"
+	depends on BR2_sh
 config BR2_TARGET_GENERIC_GETTY_TTYSAC0
 	bool "ttySAC0"
 	depends on BR2_arm
-- 
1.7.2.3
