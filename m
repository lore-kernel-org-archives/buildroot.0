From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:54:19 +0200
Subject: [Buildroot] [PATCH 28/28] barebox: bump version
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5f57641a9d064a0eb7470a9d9f03a854acf0d447.1309895466.git.thomas.petazzoni@free-electrons.com>
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
index 2745213..a254ec0 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION := 2011.05.0
+BAREBOX_VERSION := 2011.06.0
 BAREBOX_SOURCE  := barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE    := http://www.barebox.org/download/
 
-- 
1.7.4.1
