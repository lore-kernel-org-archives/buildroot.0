From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 11:58:58 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 1.8.11
Message-ID: <20131106110601.185AA9BAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20540184937888f4c3ddb01c33cfa72b29d621b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-6336, CVE-2013-6337, CVE-2013-6338, CVE-2013-6339,
CVE-2013-6340, CVE-2013-4927, CVE-2013-4929, CVE-2013-4930,
CVE-2013-4931, CVE-2013-4932, CVE-2013-4933, CVE-2013-4934,
CVE-2013-4935, CVE-2013-5718, CVE-2013-5719, CVE-2013-5720,
CVE-2013-5721 and CVE-2013-5722.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a105e52..9f968fd 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.8.8
+WIRESHARK_VERSION = 1.8.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
