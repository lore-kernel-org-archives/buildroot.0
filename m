From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:54 +0100
Subject: [Buildroot] [PATCH 23/55] barebox: bump Barebox to 2010.11
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <436ea4b1f0b294730fcd019ba321415c9b050219.1291582351.git.thomas.petazzoni@free-electrons.com>
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
index 85224ca..5bf272a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2010.05.0
+BAREBOX_VERSION:=2010.11.0
 BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE:=http://www.barebox.org/download/
 BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-- 
1.7.0.4
