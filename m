From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:50:41 +0100
Subject: [Buildroot] [git commit] libmpd: change download URL
Message-ID: <20131226175122.596779BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9b979dc342f4fa12dcc43eab8bf3bd2789cc528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old and new URLs are equivalent, but the new URL is not specific
to an older version of libmpd, which seems more logical.

[Thomas: update commit log.]

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmpd/libmpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index b78a36f..7df8c2a 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPD_VERSION = 11.8.17
-LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
+LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 LIBMPD_LICENSE = GPLv2+
