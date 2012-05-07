From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:08 +0200
Subject: [Buildroot] [PATCH 4/8] libosip2: document project URL in menuconfig
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
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
-- 
1.7.5.4
