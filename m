From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 15:25:09 +0100
Subject: [Buildroot] [git commit] openzwave: add hash for license files
Message-ID: <20171202142238.53ADF82225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c214cf6ccd98be64a9fc71f5145c7d9a038407e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openzwave/openzwave.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
index cd1231f..f3a677b 100644
--- a/package/openzwave/openzwave.hash
+++ b/package/openzwave/openzwave.hash
@@ -1,2 +1,6 @@
 # Locally computed:
 sha256	abfb4c7e7728e86ba374c2e0ef7de912594eb24a8c44935457352df844530238	openzwave-V1.5.tar.gz
+sha256	c8db08727d03bea1213cdb29459b4b489b0d68a0866765df40ff205c6cd7224b	license/license.txt
+sha256	4da452226e9064b597020ad404e1c78d8175bc31ad7c1908485a92c0a4d70284	license/lgpl.txt
+sha256	33ffdead480674d5f33e2934822a3b93c93e3f8c894667a3bf30bd1195b38f83	license/gpl.txt
+sha256	6f50ebf9af9b6658c7936ffcc6fedd99254df984c0fec2e6ffb9f3aa1c4ef3e1	license/Apache-License-2.0.txt
