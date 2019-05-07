From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:34 +0200
Subject: [Buildroot] [PATCH v1 14/28] package/madplay: replace utf-8 hyphen
 by ascii hyphen
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-14-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/madplay/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/madplay/Config.in b/package/madplay/Config.in
index 922460e0c2..a3373057a1 100644
--- a/package/madplay/Config.in
+++ b/package/madplay/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_MADPLAY
 	  Command-line front-end to libmad, a high-quality MPEG audio
 	  decoder.  It currently supports MPEG-1 and the MPEG-2
 	  extension to lower sampling frequencies, as well as the de
-	  facto MPEG 2.5 format. All three audio layers ? Layer I,
-	  Layer II, and Layer III (i.e. MP3) ? are fully implemented.
+	  facto MPEG 2.5 format. All three audio layers - Layer I,
+	  Layer II, and Layer III (i.e. MP3) - are fully implemented.

 	  http://www.underbit.com/products/mad/

--
2.21.0
