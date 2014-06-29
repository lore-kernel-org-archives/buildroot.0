From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:42:12 +0200
Subject: [Buildroot] [git commit] dhcpcd: refer to the actual homepage
Message-ID: <20140629084431.14BAA9CDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c90c5fafd3d427909787e1867ad0a54aff8b7eb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index 79063ef..ca0ad75 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_DHCPCD
 	help
 	  An RFC2131 compliant DHCP client
 
-	  http://roy.marples.name/downloads/dhcpcd
+	  http://roy.marples.name/projects/dhcpcd/
