From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Dec 2016 08:24:34 -0300
Subject: [Buildroot] [PATCH] wireshark: bump to version 2.2.3
Message-ID: <20161215112434.20405-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only security bug fixed concerns windows so it's not a security bump
for buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index c90f5bb..c6d398a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.2.txt
-sha256 f9acef5e9a9021a400b4244fafc06969f41ec594ec57fd7f0ff63bafca0055b3  wireshark-2.2.2.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.3.txt
+sha256 97bac89e88892054a5848a9f7e0c36aa399a2008900829b078e29cab0ddd593b  wireshark-2.2.3.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 6a40b8e..07a3044 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.2
+WIRESHARK_VERSION = 2.2.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.10.2
