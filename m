From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:54:13 +0200
Subject: [Buildroot] [git commit] strace: bump to version 4.14
Message-ID: <20161005205436.AF10882256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73bb46024a64d9d1e5428c4bb479b7b6eecf8159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strace/strace.hash | 5 +----
 package/strace/strace.mk   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 6c09cca..383a266 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,2 @@
-# From http://sourceforge.net/projects/strace/files/strace/4.13/
-md5	4b78c7febdd24c79d5147824d1a080a3	strace-4.13.tar.xz
-sha1	7e1fc622e2b166cb74799a14c23d6bfde9ddbc3c	strace-4.13.tar.xz
 # Locally computed
-sha256	d48f732576c91ece36a5843d63f9be054c40ef59f1e4773986042636861625d7	strace-4.13.tar.xz
+sha256	5bed5110b243dce6864bedba269446c18c8c63f553cdd7fd4f808d89a764712f	strace-4.14.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index b060137..385c002 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.13
+STRACE_VERSION = 4.14
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
