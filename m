From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:46:14 +0200
Subject: [Buildroot] [PATCH 08/11] barebox: bump version
In-Reply-To: <cover.1310417153.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310417153.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2783bf191d7bbd62574fe2c3ab6df08a9d4886ef.1310417153.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 1952c98..7e69437 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION = 2011.05.0
+BAREBOX_VERSION = 2011.06.0
 BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
 
-- 
1.7.4.1
