From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 24 Mar 2017 18:19:54 +0530
Subject: [Buildroot] [PATCH 5/6] ustream-ssl: bump version
In-Reply-To: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1490359795-18362-5-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 package/ustream-ssl/ustream-ssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
index b83d129..9b10788 100644
--- a/package/ustream-ssl/ustream-ssl.mk
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAM_SSL_VERSION = ec80adaa1b47f28d426fa19c692011ce60b992d6
+USTREAM_SSL_VERSION = 45ac93088bc6f2d8ef3b0512d8e1ddfd9c4ee9e5
 USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
 USTREAM_SSL_LICENSE = ISC
 USTREAM_SSL_LICENSE_FILES = ustream-ssl.h
-- 
2.6.2
