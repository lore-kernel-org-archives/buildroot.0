From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:00:09 +0200
Subject: [Buildroot] [git commit] nano: bump to version 2.4.1
Message-ID: <20150416060018.ECC7D8189D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6f4ca802a3b8d71a79bc19f1f39f28d60466d5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash |    2 +-
 package/nano/nano.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index b77e63a..cb5d5b8 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5076fb502680503e648cbdcbf2077e39fba193420ae19203f0a54cb2d94a75bd	nano-2.4.0.tar.gz
+sha256	6a0ceb5e1b9b9bea72d5d1f46488ace4782b1f198ea6ba558480a86d994f29d2	nano-2.4.1.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 58ee370..4d47fdb 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.4.0
+NANO_VERSION = 2.4.1
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
