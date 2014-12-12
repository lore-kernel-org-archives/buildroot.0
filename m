From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 12 Dec 2014 14:11:23 -0500
Subject: [Buildroot] [PATCH] erlang: bump to version 17.4
Message-ID: <1418411483-29636-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erlang/OTP 17.4 is a service release on the 17 track with mostly bug
fixes, but it does contain a number of new features and characteristics
improvements as well.

Some highlights of the release are:

  - eldap: Nearly all TCP options are possible to give in the
    eldap:open/2 call.
  - ssh: Added API functions ptty_alloc/3 and ptty_alloc/4, to allocate a
    pseudo tty.
  - ssl: Handle servers that may send an empty SNI extension to the client.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index ef0e0a2..045c07f 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 17.3
+ERLANG_VERSION = 17.4
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
-- 
1.9.1
