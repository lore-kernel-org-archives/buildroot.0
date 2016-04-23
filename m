From: Erdem MEYDANLI <emeydanli@gmail.com>
Date: Sat, 23 Apr 2016 17:28:18 +0300
Subject: [Buildroot] [PATCH 1/1] xenomai: Update xenomai site
Message-ID: <1461421698-20152-1-git-send-email-emeydanli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Erdem MEYDANLI <erdem.meydanli@punica.com.tr>

The new address include more recent versions of stable releases.
Therefore, newer versions than 2.6.4 can be available when required.

Signed-off-by: Erdem MEYDANLI <emeydanli@gmail.com>
Signed-off-by: Erdem MEYDANLI <erdem.meydanli@punica.com.tr>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index aa3b007..11ebf72 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -11,7 +11,7 @@ else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
 
-XENOMAI_SITE = http://download.gna.org/xenomai/stable
+XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+, ipipe patch and can driver: GPLv2
 # GFDL is not included but refers to gnu.org
-- 
2.8.1
