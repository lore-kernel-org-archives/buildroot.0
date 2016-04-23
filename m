From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Apr 2016 21:37:23 +0200
Subject: [Buildroot] [git commit] xenomai: update download site
Message-ID: <20160423193856.4B2A2819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d88100f4343016a2b492a896bf8225fca051eb88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new address include more recent versions of stable releases.
Therefore, newer versions than 2.6.4 can be available when required.

Signed-off-by: Erdem MEYDANLI <erdem.meydanli@punica.com.tr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
