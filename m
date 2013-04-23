From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 09:04:47 +0200
Subject: [Buildroot] [git commit] wireless-regdb: strip empty line
Message-ID: <20130423070520.691999B7E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adc231d6a15dd3d2cdc18190c9befaa655bba7ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wireless-regdb/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index 89a6147..d9c7b8d 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -7,4 +7,3 @@ config BR2_PACKAGE_WIRELESS_REGDB
 	  allowed radio frequencies for each local jurisdiction.
 
 	  http://linuxwireless.org/en/developers/Regulatory
-
