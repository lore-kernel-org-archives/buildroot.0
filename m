From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 08:52:41 +0100
Subject: [Buildroot] [git commit] pwgen: bump to version 2.07
Message-ID: <20141107075730.60C3CB12B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51f5f8a1657c8df993803920f3af8ce293fc70a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pwgen/pwgen.hash |    3 +++
 package/pwgen/pwgen.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/pwgen/pwgen.hash b/package/pwgen/pwgen.hash
new file mode 100644
index 0000000..2997ed3
--- /dev/null
+++ b/package/pwgen/pwgen.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/pwgen/files/pwgen/2.07/
+md5	910b1008cdd86445e9e01305d21ee4c5	pwgen-2.07.tar.gz
+sha1	51180f9cd5530d79eea18b2443780dec4ec5ea43	pwgen-2.07.tar.gz
diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index cdc2fd3..9810097 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PWGEN_VERSION = 2.06
+PWGEN_VERSION = 2.07
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
 PWGEN_LICENSE = GPLv2
 PWGEN_LICENSE_FILES = debian/copyright
