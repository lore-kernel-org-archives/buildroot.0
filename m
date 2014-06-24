From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:31 -0300
Subject: [Buildroot] [PATCH 25/54] open2300: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-25-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/open2300/open2300.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index a89c9a2..307fffe 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk/
+OPEN2300_SITE = http://www.lavrsen.dk/svn/open2300/trunk/
 OPEN2300_SITE_METHOD = svn
-OPEN2300_VERSION     = 12
+OPEN2300_VERSION = 12
+OPEN2300_LICENSE = GPLv2
+OPEN2300_LICENSE_FILES = COPYING
 
 OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
 		histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
-- 
1.8.5.5
