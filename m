From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 12:08:25 +0200
Subject: [Buildroot] [PATCH 07/10] libgtk2: bump to 2.24.4
In-Reply-To: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3be362e6bd12b79af427d772bdfcd1e0bcb55e10.1305713253.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 6e14d27..98b27ae 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -3,8 +3,8 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION_MAJOR:=2.22
-LIBGTK2_VERSION_MINOR:=0
+LIBGTK2_VERSION_MAJOR:=2.24
+LIBGTK2_VERSION_MINOR:=4
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
-- 
1.7.1
