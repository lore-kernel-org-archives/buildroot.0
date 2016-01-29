From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2016 17:13:01 +0100
Subject: [Buildroot] [git commit] moarvm: bump to version 2016.01
Message-ID: <20160201224704.8EAA87F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1214ecc5d09dc4ec351a60509cf08837eb21c5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 977da7e..4706177 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2d05fbac7aa431d5a10625958df1f3d47963d79ede2c875f52fec3ea65ea445f  MoarVM-2015.10.tar.gz
+sha256  d409b684c7c92b144b31cf7f0408f30ccbb033ce646f57d7fbaeb9683773e37b  MoarVM-2016.01.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index a918b91..7456902 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2015.10
+MOARVM_VERSION = 2016.01
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
