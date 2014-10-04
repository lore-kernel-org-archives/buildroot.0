From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 14:20:37 +0200
Subject: [Buildroot] [git commit] autossh: bump to version 1.4d
Message-ID: <20141004122129.7A67D9D821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02dcdfdf2ab7c80febc6ef012c916b16d69e4945
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autossh/autossh.hash |    4 ++++
 package/autossh/autossh.mk   |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/autossh/autossh.hash b/package/autossh/autossh.hash
new file mode 100644
index 0000000..e1e3b2c
--- /dev/null
+++ b/package/autossh/autossh.hash
@@ -0,0 +1,4 @@
+# From http://www.harding.motd.ca/autossh/autossh-1.4d.cksums
+md5	89c09b50aa2d57814f808d727e937d0f	autossh-1.4d.tgz
+sha1	27da23c357f8d263aba6ecf3e8792a3552d90e50	autossh-1.4d.tgz
+sha256	00008fe458bde4c94e98bfa96e1e6e18c4107a1f9fc8a538556b82e91ddedc16	autossh-1.4d.tgz
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 75d7892..51f9faf 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOSSH_VERSION = 1.4c
+AUTOSSH_VERSION = 1.4d
 AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
