From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 30 Apr 2015 09:38:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/monolite: bump to version 117
In-Reply-To: <1430379540-4459-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1430379540-4459-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1430379540-4459-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump is required for proper compiling mono 4.0.1.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index b3c7553..aa6c28c 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 111
+MONOLITE_VERSION = 117
 MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
-- 
1.9.1
