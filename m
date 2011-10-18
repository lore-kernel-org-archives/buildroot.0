From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 09:32:09 -0300
Subject: [Buildroot] [PATCH 1/2] ntfsprogs: mark as deprecated
Message-ID: <1318941130-19244-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfsprogs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
index 836a2b6..561c1d4 100644
--- a/package/ntfsprogs/Config.in
+++ b/package/ntfsprogs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NTFSPROGS
 	bool "ntfsprogs"
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
+	depends on BR2_DEPRECATED
 	help
 	  wide collection of NTFS utilities
 
-- 
1.7.3.4
