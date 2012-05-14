From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:57:54 +0200
Subject: [Buildroot] [git commit branch/next] libosip2: document project URL
	in menuconfig
Message-ID: <20120514210033.1C0D696CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d1bbcb5b455d09fb08964c781788482187838c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libosip2/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libosip2/Config.in b/package/libosip2/Config.in
index 1b248a0..be5de2d 100644
--- a/package/libosip2/Config.in
+++ b/package/libosip2/Config.in
@@ -7,3 +7,5 @@ config BR2_PACKAGE_LIBOSIP2
 	  control SIP based sessions in their applications.
 	  SIP is a open standard replacement from IETF for H323.
 
+	  http://www.gnu.org/software/osip/
+
