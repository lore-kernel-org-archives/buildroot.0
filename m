From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:49 -0300
Subject: [Buildroot] [PATCH 43/54] uclibc: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-43-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 4394030..19eb484 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -6,6 +6,8 @@
 
 UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 UCLIBC_SOURCE ?= uClibc-$(UCLIBC_VERSION).tar.bz2
+UCLIBC_LICENSE = LGPLv2.1+
+UCLIBC_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
-- 
1.8.5.5
