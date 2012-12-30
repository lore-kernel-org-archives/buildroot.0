From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:46 +0100
Subject: [Buildroot] [PATCH 08/19] efl/libelementary: bump to version 1.7.4
	and change download location
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a0b8b6e46d18b0f8f500338b5491598809156a4e.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libelementary/libelementary.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 8957d03..81289ff 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 0.8.0.65643
+LIBELEMENTARY_VERSION = 1.7.4
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
 LIBELEMENTARY_LICENSE = LGPLv2.1
 LIBELEMENTARY_LICENSE_FILES = COPYING
 
-- 
1.7.9.5
