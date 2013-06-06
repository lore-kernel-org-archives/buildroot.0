From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu,  6 Jun 2013 11:53:24 +0200
Subject: [Buildroot] [PATCH 1/7] ccid: fix header line
In-Reply-To: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1370512410-8553-2-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/ccid/ccid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 51c3887..570b1e8 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -2,7 +2,7 @@
 #
 # CCID
 #
-# ########################################################
+##########################################################
 CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = http://alioth.debian.org/frs/download.php/3768
-- 
1.8.1.2
