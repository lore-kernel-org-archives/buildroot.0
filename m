From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 14:09:35 +0200
Subject: [Buildroot] [git commit] wireshark: security bump to version 1.8.8
Message-ID: <20130610123723.9380E9A86F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0df82bc193b40b70194fb7a10b34797eab8b942a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes wnpa-sec-2013-32, wnpa-sec-2013-33, wnpa-sec-2013-34,
wnpa-sec-2013-35, wnpa-sec-2013-36, wnpa-sec-2013-37, wnpa-sec-2013-38,
wnpa-sec-2013-39, wnpa-sec-2013-40 and wnpa-sec-2013-41.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wireshark/wireshark.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2d4ea10..a61e017 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.8.7
+WIRESHARK_VERSION = 1.8.8
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
