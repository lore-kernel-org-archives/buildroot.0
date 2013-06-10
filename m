From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jun 2013 08:13:26 -0300
Subject: [Buildroot] [PATCH 2/2] wireshark: security bump to version 1.8.8
In-Reply-To: <1370862806-14534-1-git-send-email-gustavo@zacarias.com.ar>
References: <1370862806-14534-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1370862806-14534-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes wnpa-sec-2013-32, wnpa-sec-2013-33, wnpa-sec-2013-34,
wnpa-sec-2013-35, wnpa-sec-2013-36, wnpa-sec-2013-37, wnpa-sec-2013-38,
wnpa-sec-2013-39, wnpa-sec-2013-40 and wnpa-sec-2013-41.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.5
