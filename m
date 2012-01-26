From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:32 -0300
Subject: [Buildroot] [PATCH 13/13] ipset: bump to version 6.11
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-13-git-send-email-gustavo@zacarias.com.ar>
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
index d8df026..06393f4 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.10
+IPSET_VERSION = 6.11
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_AUTORECONF = YES
-- 
1.7.3.4
