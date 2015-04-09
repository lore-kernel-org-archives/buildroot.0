From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu,  9 Apr 2015 10:01:02 -0400
Subject: [Buildroot] [PATCH] erlang: bump version to 17.5
Message-ID: <1428588062-9074-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also adds a hash file for the new version.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.hash | 2 ++
 package/erlang/erlang.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/erlang/erlang.hash

diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
new file mode 100644
index 0000000..2d6a39a
--- /dev/null
+++ b/package/erlang/erlang.hash
@@ -0,0 +1,2 @@
+# From http://www.erlang.org/download/MD5
+md5	346dd0136bf1cc28cebc140e505206bb	otp_src_17.5.tar.gz
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 0c76531..499f62c 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 17.4
+ERLANG_VERSION = 17.5
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
-- 
1.9.1
