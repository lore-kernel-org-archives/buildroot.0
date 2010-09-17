From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:53 -0700
Subject: [Buildroot] [PATCH 08/17] Corrected the position of the ti-dspbios
	package in the menu
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-9-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 834d467..f127c92 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -39,12 +39,12 @@ endchoice
 
 comment "Target components"
 source "package/ti/ti-codecs-omap3/Config.in"
-source "package/ti/ti-dspbios/Config.in"
 
 comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
 source "package/ti/ti-cgt6x/Config.in"
 source "package/ti/ti-codec-engine/Config.in"
 source "package/ti/ti-dmai/Config.in"
+source "package/ti/ti-dspbios/Config.in"
 
 endif
-- 
1.7.0.4
