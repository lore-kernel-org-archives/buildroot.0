From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jan 2020 11:20:35 +0100
Subject: [Buildroot] [git commit] package/moarvm: bump to version 2020.01.1
Message-ID: <20200125105054.A90D283968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee364d438065bcaf185a112b47a884ae3a21246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 5e11a20035..908885f686 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9c8d8c01d64d404b35527d0ac773934a73201b84390cd02b14a9d9c5b12cde14  MoarVM-2020.01.tar.gz
+sha256 dcb61e44a098e8375c385eb9d52bd6394255a388697b2f6a52d88e6cf4a53587  MoarVM-2020.01.1.tar.gz
 sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 685128aaef..e554ddb6d0 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.01
+MOARVM_VERSION = 2020.01.1
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
