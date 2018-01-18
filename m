From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:02:30 +0100
Subject: [Buildroot] [git commit] package/xen: Bump to latest 4.10.0 release
Message-ID: <20180118210746.25E5783EE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d5796062f19db89880dac899030ac4cbc0372f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index fcd4e85..fa4d25b 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ecf88b01f44cd8f4ef208af3f999dceb69bdd2a316d88dd9a9535ea7b49ed356 xen-4.9.1.tar.gz
+sha256 0262a7023f8b12bcacfb0b25e69b2a63291f944f7683d54d8f33d4b2ca556844 xen-4.10.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index d311859..6aa066e 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.9.1
+XEN_VERSION = 4.10.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
