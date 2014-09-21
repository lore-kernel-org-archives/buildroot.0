From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 21 Sep 2014 13:08:59 -0400
Subject: [Buildroot] [PATCH] erlang: bump to version 17.3
Message-ID: <1411319339-3375-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erlang/OTP 17.3 is a service release on the 17 track with mostly bug
fixes, but it does contain a number of new features and characteristics
improvements as well.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 5474952..6f62933 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 17.1
+ERLANG_VERSION = 17.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
-- 
1.9.1
