From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:51:04 +0200
Subject: [Buildroot] [git commit] lvm2: add homepage link
Message-ID: <20170329195155.479C282620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9db1b7c94b6ec38124fd67a7bf43c7798007934e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 23dff70..0f60649 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -19,6 +19,8 @@ config BR2_PACKAGE_LVM2
 	  user-space. This makes it useful for not only LVM, but EVMS,
 	  software raid, and other drivers that create "virtual" block devices.
 
+	  http://www.sourceware.org/lvm2/
+
 if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
