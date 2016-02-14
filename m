From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 14 Feb 2016 23:03:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/monolinte: updating download url
In-Reply-To: <1455487411-14605-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1455487411-14605-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1455487411-14605-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest mono revision changed download url for monolite, updating it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 3c53bff..761e776 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONOLITE_VERSION = 138
-MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
+MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
 
-- 
1.9.1
