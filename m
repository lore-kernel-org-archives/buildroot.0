From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:41:59 +0100
Subject: [Buildroot] [PATCH 06/20] efl/libefreet: bump to version 1.7.4
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8e3f945a0d549f876bf866b83ce1b4575cbe8267.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libefreet/libefreet.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index c0d7397..b23a5a5 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEFREET_VERSION = 1.1.0
+LIBEFREET_VERSION = 1.7.4
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
 LIBEFREET_SITE = http://download.enlightenment.org/releases/
 LIBEFREET_LICENSE = BSD-2c
-- 
1.7.9.5
