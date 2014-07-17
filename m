From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 23:44:43 +0200
Subject: [Buildroot] [git commit] gnupg: security bump to version 1.4.18
Message-ID: <20140717215434.9BC109D267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90bb58d74bcc8d7739b6ec8f6763033064b717ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-4617 (The do_uncompress function in g10/compress.c
allows context-dependent attackers to cause a denial of service
(infinite loop) via malformed compressed packets, as demonstrated by an
a3 01 5b ff byte sequence.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg/gnupg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 4c96967..fca6d51 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.17
+GNUPG_VERSION = 1.4.18
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
