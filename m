From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Mar 2017 18:19:34 +0300
Subject: [Buildroot] [PATCH] lvm2: add homepage link
Message-ID: <84cbc9226f42683c5d2b427c2008648e36cc2826.1490800774.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lvm2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 23dff707ccf5..0f606494ba35 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -19,6 +19,8 @@ config BR2_PACKAGE_LVM2
 	  user-space. This makes it useful for not only LVM, but EVMS,
 	  software raid, and other drivers that create "virtual" block devices.
 
+	  http://www.sourceware.org/lvm2/
+
 if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
-- 
2.11.0
