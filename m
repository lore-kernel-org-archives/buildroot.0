From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Feb 2018 23:31:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-goom: fix broken
 hash
Message-ID: <20180203223150.27467-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Comparing both tarballs, the one from github.com and the one stored at
sources.buildroot.net, using diff showed no differences.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index fa5fbf6c37..fb247cc7a9 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 501b8b1d5bd174ec71d57894293ae5eb0c1f41c3b725ab5e7b5a1c5eeea77a7f  kodi-visualisation-goom-54da35870930acd1a3a36195dd2c1498ac336b90.tar.gz
+sha256 b05a1249a8f61e0d10c6513d117b789ee40b02c03fb8e717d82b17a95fe37a4b  kodi-visualisation-goom-54da35870930acd1a3a36195dd2c1498ac336b90.tar.gz
-- 
2.11.0
