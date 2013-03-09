From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 21:32:20 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 1.8.6
Message-ID: <20130309212058.8D6CF9AF4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98d7bb16a6a63e9b73b52e9519c9925e3f9685b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2475, CVE-2013-2476, CVE-2013-2477, CVE-2013-2478,
CVE-2013-2479, CVE-2013-2480, CVE-2013-2481, CVE-2013-2482,
CVE-2013-2483, CVE-2013-2484, CVE-2013-2485, CVE-2013-2486,
CVE-2013-2487, and CVE-2013-2488.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wireshark/wireshark.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c9fb44b..5a4d8b5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WIRESHARK_VERSION = 1.8.5
+WIRESHARK_VERSION = 1.8.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
