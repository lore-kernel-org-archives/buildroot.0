From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Jul 2012 10:47:43 -0300
Subject: [Buildroot] [PATCH 4/6] ipset: bump to version 6.13
In-Reply-To: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
References: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1342360065-10106-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 3cd1263..37994f5 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.12.1
+IPSET_VERSION = 6.13
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkg-config
-- 
1.7.8.6
