From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:17:52 +0200
Subject: [Buildroot] [git commit branch/next] bind: security bump to version
	9.6-ESV-R7-P2
Message-ID: <20120802195302.1830096CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c53e14e30c3df40c579032f3c50e5b3db34efd98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2012-3817

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5de451c..736001c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R7-P1
+BIND_VERSION = 9.6-ESV-R7-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
