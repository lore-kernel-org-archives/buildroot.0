From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 21:16:59 +0100
Subject: [Buildroot] [PATCH/next 2/6] package/belle-sip: bump to version
 4.4.8
In-Reply-To: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
References: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
Message-ID: <20201117201703.137790-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/belle-sip/belle-sip.hash | 2 +-
 package/belle-sip/belle-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/belle-sip/belle-sip.hash b/package/belle-sip/belle-sip.hash
index 889ad2be70..670ce0062e 100644
--- a/package/belle-sip/belle-sip.hash
+++ b/package/belle-sip/belle-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3ac7051ea6ac758cccbf1483a5dd6cda4293b5cde1370a3f0d298e3a6f0ee032  belle-sip-4.3.1.tar.gz
+sha256  eabba615c97080572c1b9d3c76f8f9cf6a7432eedf37482672e5fa178a688f72  belle-sip-4.4.8.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index 1daef1d2df..b5169be488 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BELLE_SIP_VERSION = 4.3.1
+BELLE_SIP_VERSION = 4.4.8
 BELLE_SIP_SITE = \
 	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
 BELLE_SIP_LICENSE = GPL-3.0+
-- 
2.29.2
