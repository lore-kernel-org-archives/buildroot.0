From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu,  6 Nov 2014 09:07:20 +0100
Subject: [Buildroot] [PATCH 2/2] lttng-tools: bump version
In-Reply-To: <1415261240-31014-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1415261240-31014-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1415261240-31014-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous releases was removed from their servers has they did a
releases from a wrong tag, the resulting binary was wrong.
Thanks to "Yann E. Morin" for spotting that.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/lttng-tools/lttng-tools.hash | 2 +-
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 92a4401..fc2640e 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  1084ce1fac0030cb5e0e3e117002444ceb9f94d6a15a6cce6607c480eca9b21b  lttng-tools-2.5.1.tar.bz2
+sha256  1f52d342fb5b56a6675748f0b8e8557ec7c4e90732c3d8f5732bd10b920b233d  lttng-tools-2.5.2.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 187b851..44b6880 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.5.1
+LTTNG_TOOLS_VERSION = 2.5.2
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
-- 
2.1.1
