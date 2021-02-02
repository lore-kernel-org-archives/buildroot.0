From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 16:33:40 +0100
Subject: [Buildroot] [git commit] package/moarvm: bump to version 2020.12
Message-ID: <20210202152050.C1BDA864D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3894932b84aa3d00404b10f914da1de69ac0e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 36f0a81f31..abe96c3d4b 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  637883083f16c4398ffd3685ea6411daa605dd0862e1f59cce632bb2b994f2c4  MoarVM-2020.10.tar.gz
+sha256  08914f1c464151ebc678cf0d360c9e479a036178fa7c9ddfd34aa4d556d03ea2  MoarVM-2020.12.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 9fe5f4c077..1f41404415 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.10
+MOARVM_VERSION = 2020.12
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
