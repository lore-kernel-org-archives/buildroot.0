From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:39:56 +0200
Subject: [Buildroot] [git commit] moarvm: bump to version 2016.10
Message-ID: <20161029134001.708C17FDFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8271f0c8e7e0f91395e7ca2b229ea09705ee13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index f045f4f..514a1bf 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6fe9000daada59535747f2557cc73573241ba8a6044271caf1647aa37be33c6d  MoarVM-2016.04.tar.gz
+sha256  d8cb9fe74267dd933c3e405b098dea99cb9c0561aedb06e8efd8ddaef43396d0  MoarVM-2016.10.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index fd05468..d2421fd 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2016.04
+MOARVM_VERSION = 2016.10
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
