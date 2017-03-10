From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 10:28:25 +0100
Subject: [Buildroot] [git commit] libnl: update homepage link
Message-ID: <20170310092852.94AA98256F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d255ed499d874a19be552146f732efddbea57a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old link is broken. Use the github repo instead.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 46877c3..1e29f57 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBNL
 	help
 	  A library for applications dealing with netlink socket.
 
-	  http://people.suug.ch/~tgr/libnl/
+	  https://github.com/thom311/libnl
 
 if BR2_PACKAGE_LIBNL
 
