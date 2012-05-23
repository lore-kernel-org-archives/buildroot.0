From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:34 -0300
Subject: [Buildroot] [PATCH 2/7] ipset: bump to version 6.12.1
In-Reply-To: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337779779-1783-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 06393f4..3cd1263 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.11
+IPSET_VERSION = 6.12.1
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
-IPSET_AUTORECONF = YES
 IPSET_DEPENDENCIES = libmnl host-pkg-config
 IPSET_CONF_OPT = --with-kmod=no
 
-- 
1.7.3.4
