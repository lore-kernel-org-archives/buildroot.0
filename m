From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Oct 2012 14:40:49 -0300
Subject: [Buildroot] [PATCH 2/5] ipset: bump to version 6.14
In-Reply-To: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
References: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1349199652-12928-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index f554367..999c5cb 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.13
+IPSET_VERSION = 6.14
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPT = --with-kmod=no
+IPSET_LICENSE = GPLv2
+IPSET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
