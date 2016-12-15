From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 13:58:05 +0100
Subject: [Buildroot] [git commit] wireshark: bump to version 2.2.3
Message-ID: <20161215125823.A803081E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=326a9559dc8d4fa816d58c6434d8a21bc7307fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only security bug fixed concerns windows so it's not a security bump
for buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
