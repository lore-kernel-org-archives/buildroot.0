From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 13:40:15 -0300
Subject: [Buildroot] [PATCH 5/7] ipset: bump to version 6.9.1
In-Reply-To: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
References: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1315932017-20307-5-git-send-email-gustavo@zacarias.com.ar>
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
index 9d901fc..260b2b6 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.8
+IPSET_VERSION = 6.9.1
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_AUTORECONF = YES
-- 
1.7.3.4
