From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 21:45:20 +0100
Subject: [Buildroot] [git commit branch/next] autossh: bump to version 1.4e
Message-ID: <20150215204715.DB0DD7F900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f61fb901d9c6ef618a3c8b90a74d08a6b4b29577
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autossh/autossh.hash |    6 ++----
 package/autossh/autossh.mk   |    2 +-
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
