From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:42 -0300
Subject: [Buildroot] [PATCH 02/10] coreutils: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/coreutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index d7d0779..4fc70f7 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -7,6 +7,8 @@
 COREUTILS_VERSION = 8.18
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
+COREUTILS_LICENSE = GPLv3
+COREUTILS_LICENSE_FILES = COPYING
 
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
-- 
1.7.12.4
