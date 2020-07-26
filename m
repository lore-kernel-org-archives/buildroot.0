From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 21:47:22 +0200
Subject: [Buildroot] [git commit] package/moarvm: bump to 2020.07
Message-ID: <20200726194558.2DAED86D69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=620cb0e8bd52b9ae802db74e2cfc74da365c999f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index fc915944f9..23040d9e2d 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db9759f16f76cb6d3b1f4baff9616c5ddb99fbb47ea62f54a5cc251b6ea99dc2  MoarVM-2020.06.tar.gz
+sha256  da48887a1be0e397586b3470c2627d04c64d1e0caf9305ee7dc8db8db739f7cf  MoarVM-2020.07.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index d2f1a01c70..f49191f173 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.06
+MOARVM_VERSION = 2020.07
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
