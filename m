From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 00:46:17 +0200
Subject: [Buildroot] [PATCH 3/3] Bump samba to 3.3.13 [CVE-2010-2063]
In-Reply-To: <cover.1280270762.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280270762.git.thomas.petazzoni@free-electrons.com>
Message-ID: <018c77a5486525adcec6a0994ce7a5aa6e654a5c.1280270762.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 39968a9..1c59070 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.3.12
+SAMBA_VERSION:=3.3.13
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 
-- 
1.7.0.4
