From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 19:28:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/quota: renumber patches
Message-ID: <1453573714-19731-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../{01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch}    | 0
 .../quota/{02-fix-static-linking.patch => 0002-fix-static-linking.patch}  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/quota/{01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch} (100%)
 rename package/quota/{02-fix-static-linking.patch => 0002-fix-static-linking.patch} (100%)

diff --git a/package/quota/01-tools-getrpcbynumber.patch b/package/quota/0001-tools-getrpcbynumber.patch
similarity index 100%
rename from package/quota/01-tools-getrpcbynumber.patch
rename to package/quota/0001-tools-getrpcbynumber.patch
diff --git a/package/quota/02-fix-static-linking.patch b/package/quota/0002-fix-static-linking.patch
similarity index 100%
rename from package/quota/02-fix-static-linking.patch
rename to package/quota/0002-fix-static-linking.patch
-- 
2.7.0.rc3
