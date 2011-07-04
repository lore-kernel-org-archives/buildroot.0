From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:45 +0200
Subject: [Buildroot] [PATCH 28/28] barebox: bump version
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <574cffc199a57f35f8c8c366e796f2f4632e08b3.1309815048.git.thomas.petazzoni@free-electrons.com>
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
index 8f39661..1bbbb46 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION = 2011.05.0
+BAREBOX_VERSION = 2011.06.0
 BAREBOX_SOURCE  = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE    = http://www.barebox.org/download/
 
-- 
1.7.4.1
