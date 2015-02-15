From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Feb 2015 12:01:40 -0300
Subject: [Buildroot] [PATCH] autossh: bump to version 1.4e
Message-ID: <1424012500-15196-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/autossh/autossh.hash | 6 ++----
 package/autossh/autossh.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/autossh/autossh.hash b/package/autossh/autossh.hash
index e1e3b2c..4f3de13 100644
--- a/package/autossh/autossh.hash
+++ b/package/autossh/autossh.hash
@@ -1,4 +1,2 @@
-# From http://www.harding.motd.ca/autossh/autossh-1.4d.cksums
-md5	89c09b50aa2d57814f808d727e937d0f	autossh-1.4d.tgz
-sha1	27da23c357f8d263aba6ecf3e8792a3552d90e50	autossh-1.4d.tgz
-sha256	00008fe458bde4c94e98bfa96e1e6e18c4107a1f9fc8a538556b82e91ddedc16	autossh-1.4d.tgz
+# From http://www.harding.motd.ca/autossh/autossh-1.4e.cksums
+sha256	9e8e10a59d7619176f4b986e256f776097a364d1be012781ea52e08d04679156	autossh-1.4e.tgz
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 51f9faf..01d3c65 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOSSH_VERSION = 1.4d
+AUTOSSH_VERSION = 1.4e
 AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
-- 
2.0.5
