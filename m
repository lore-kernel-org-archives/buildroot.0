From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 May 2011 09:39:43 -0300
Subject: [Buildroot] [PATCH 2/3] toolchain: bump 2.6.38 headers to 2.6.38.6
In-Reply-To: <1305117584-22139-1-git-send-email-gustavo@zacarias.com.ar>
References: <1305117584-22139-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1305117584-22139-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 6bf4d6f..da6f1c3 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -46,6 +46,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.35.13"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38.5"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.38.6"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4
