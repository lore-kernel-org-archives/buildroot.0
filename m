From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 21:08:04 +0100
Subject: [Buildroot] [git commit] package/nano: bump to version 3.2
Message-ID: <20190101200759.085A58843A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1cbd352ee66141635aefd619fa980f3cd2a8ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 6b0f90bf49..eae648d16e 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v3/nano-3.0.tar.xz.asc
+# https://www.nano-editor.org/dist/v3/nano-3.2.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 e0a5bca354514e64762c987c200a8758b05e7bcced3b00b3e48ea0a2d383c8a0  nano-3.0.tar.xz
+sha256 d12773af3589994b2e4982c5792b07c6240da5b86c5aef2103ab13b401fe6349  nano-3.2.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a1d2fe9869..206d210a16 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 3
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
