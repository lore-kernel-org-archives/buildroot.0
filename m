From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:39 -0600
Subject: [Buildroot] [NEXT 24/26] tcpdump: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-25-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/tcpdump/tcpdump.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 2a6d095..3c6220b 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -8,6 +8,7 @@ TCPDUMP_VERSION = 4.9.2
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
+TCPDUMP_CPE_ID = $(TCPDUMP_NAME):$(TCPDUMP_NAME):$(TCPDUMP_VERSION)
 TCPDUMP_CONF_ENV = \
 	ac_cv_linux_vers=2 \
 	td_cv_buggygetaddrinfo=no \
-- 
1.9.1
