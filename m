From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 14 Oct 2013 16:05:39 +0200
Subject: [Buildroot] [PATCH 2/4] netcat: add license information
In-Reply-To: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
References: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
Message-ID: <1381759541-15243-2-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/netcat/netcat.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 5b083e6..5d01ebb 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -6,5 +6,7 @@
 
 NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
+NETCAT_LICENSE = GPLv2+
+NETCAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.10.4
