From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Mar 2021 20:13:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: annotate
 CVE-2021-27803
Message-ID: <20210322191316.1171234-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a WPA_SUPPLICANT_IGNORE_CVES entry for CVE-2021-27803 which was
fixed by commit 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index c82db43c1c..96f0596bfe 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -22,6 +22,9 @@ WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
 # 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 WPA_SUPPLICANT_IGNORE_CVES += CVE-2019-16275
 
+# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
+WPA_SUPPLICANT_IGNORE_CVES += CVE-2021-27803
+
 # install the wpa_client library
 WPA_SUPPLICANT_INSTALL_STAGING = YES
 
-- 
2.30.1
