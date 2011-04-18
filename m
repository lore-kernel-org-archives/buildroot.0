From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Apr 2011 11:09:22 -0300
Subject: [Buildroot] [PATCH 3/5] toolchain: bump kernel headers 2.6.35.12
	and 2.6.38.3
In-Reply-To: <1303135764-20972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303135764-20972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303135764-20972-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1da6d53..68151d0 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -43,9 +43,9 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.12"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38.2"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.38.3"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.3.4
