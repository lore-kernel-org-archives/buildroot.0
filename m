From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:34 -0300
Subject: [Buildroot] [PATCH 28/54] proxychains-ng: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-28-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/proxychains-ng/proxychains-ng.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 7c2ffbf..5415f04 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -7,6 +7,8 @@
 PROXYCHAINS_NG_VERSION = 4.6
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
+PROXYCHAINS_NG_LICENSE = GPLv2+
+PROXYCHAINS_NG_LICENSE_FILES =  COPYING
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
 	cd $(@D) && \
-- 
1.8.5.5
