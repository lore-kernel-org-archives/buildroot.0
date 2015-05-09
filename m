From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  9 May 2015 10:41:27 +0200
Subject: [Buildroot] [PATCH 1/3] package/mono: fixing mono version
In-Reply-To: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1431160889-3851-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes to the correct mono version 4.0.0 as stated on
the download page.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index c0a0827..63026f1 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.0.1
+MONO_VERSION = 4.0.0
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
