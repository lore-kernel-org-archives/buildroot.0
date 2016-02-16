From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:53:03 +0100
Subject: [Buildroot] [git commit] musl: bump to version 1.1.13
Message-ID: <20160302202752.5CD9C80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14f8ebab3a92ef0537bd18e63628f2a0bbd239c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.hash | 2 +-
 package/musl/musl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index b136599..0970ad6 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	720b83c7e276b4b679c0bffe9509340d5f81fd601508e607e708177df0d31c0e  musl-1.1.12.tar.gz
+sha256	bbacdc64f557d0c4857f7d2daf592c32c29aec1babbb94fcf01a2e05bed15013  musl-1.1.13.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 2cc6699..d68e769 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.12
+MUSL_VERSION = 1.1.13
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
