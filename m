From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Wed,  5 Jun 2019 21:56:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/autossh: bump version to 1.4g
Message-ID: <1559764619-8118-1-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 1.4g most notably addresses a bug that could see an alarm signal
occur without a handler, causing autossh to exit inappropriately.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 package/autossh/autossh.hash | 10 +++++-----
 package/autossh/autossh.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/autossh/autossh.hash b/package/autossh/autossh.hash
index 5c6cfbc..226003f 100644
--- a/package/autossh/autossh.hash
+++ b/package/autossh/autossh.hash
@@ -1,6 +1,6 @@
-# From http://www.harding.motd.ca/autossh/autossh-1.4f.cksums
-sha256 0172e5e1bea40c642e0ef025334be3aadd4ff3b4d62c0b177ed88a8384e2f8f2  autossh-1.4f.tgz
-sha1 28189c42ab2e05448596a44adc9d62071172fe9b  autossh-1.4f.tgz
-md5 432ed721a71b8af4b5763b5c484f80df  autossh-1.4f.tgz
+# From http://www.harding.motd.ca/autossh/autossh-1.4g.cksums
+sha256 5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31ae21277  autossh-1.4g.tgz
+sha1 bd88da0e296b8d85722ee9e7c314e9319e5b2db8  autossh-1.4g.tgz
+md5 2b804bc1bf6d2f2afaa526d02df7c0a2  autossh-1.4g.tgz
 # Locally computed
-sha256 b6938db718166520533b1d56b01e1eb5f0ad508624478e674938b8f507b66d98  autossh.c
+sha256 014ec5a85a8899d4ea0e0a886bb3fc4c72b4bbec6414093ba1fdac5b178c25b4  autossh.c
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 5af8b73..899e5cd 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOSSH_VERSION = 1.4f
+AUTOSSH_VERSION = 1.4g
 AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
-- 
2.7.4
