From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:06 +0100
Subject: [Buildroot] [PATCH 3/8] arch/Config.in.arm: add BR2_ARM_CPU_ARMV8
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <be4e9f78b8b674069e3ac4d85b212aead568f94f.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In order to prepare the addition of ARM64 cores, add the blind
BR2_ARM_CPU_ARMV8 option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 0ca6a14..9e5accc 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -55,6 +55,9 @@ config BR2_ARM_CPU_ARMV7A
 config BR2_ARM_CPU_ARMV7M
 	bool
 
+config BR2_ARM_CPU_ARMV8
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_arm926t
-- 
2.7.4
