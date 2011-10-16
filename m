From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Oct 2011 00:04:28 -0300
Subject: [Buildroot] [PATCH 2/7] openntpd: style fix - don't capitalize in
	menu
In-Reply-To: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318734273-24454-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 6b8beb8..e9c3bb5 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_OPENNTPD
-	bool "OpenNTPD"
+	bool "openntpd"
 	help
 	     OpenNTPD is an easy to use implementation of the Network Time
 	     Protocol. It provides the ability to sync the local clock
-- 
1.7.3.4
