From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:46:58 +0100
Subject: [Buildroot] [PATCH 03/21 RFC] package/linux-headers: add licensing
	information
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <794b034b2257530f7d141bfc19c98a7443b98cb5.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/linux-headers/linux-headers.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index ca68a5b..1b8b81b 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -16,6 +16,8 @@ else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+LINUX_HEADERS_LICENSE = GPLv2
+LINUX_HEADERS_LICENSE_FILES = COPYING
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
-- 
1.9.1
