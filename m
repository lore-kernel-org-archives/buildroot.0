From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:18 -0300
Subject: [Buildroot] [PATCH 05/10] openvpn: bump to version 2.2.2
In-Reply-To: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325787983-8591-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 587368b..bcb121d 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.2.1
+OPENVPN_VERSION = 2.2.2
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_CONF_OPT = --enable-small --disable-plugins
 
-- 
1.7.3.4
