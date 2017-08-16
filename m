From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:10:17 +0200
Subject: [Buildroot] [git commit] whois: use github repo as home page
Message-ID: <20170816210402.5B607820E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=945cda6d17f3e23135eb1c3f9d3fddcd33af864a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The github repo is more informative than the list Marco's software on
the previous link.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whois/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index 9505d58..d2a0302 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_WHOIS
 	help
 	  Improved whois client.
 
-	  http://www.linux.it/~md/software/
+	  https://github.com/rfc1036/whois
