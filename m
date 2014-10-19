From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 21:49:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/liblog4c-localtime: use numbered
	patches
Message-ID: <1413748165-2732-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...d-path.patch => liblog4c-0001-localtime-fix-underquoted-path.patch} |    0
 ...localtime-nothread.patch => liblog4c-0002-localtime-nothread.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/liblog4c-localtime/{liblog4c-localtime-fix-underquoted-path.patch => liblog4c-0001-localtime-fix-underquoted-path.patch} (100%)
 rename package/liblog4c-localtime/{liblog4c-localtime-nothread.patch => liblog4c-0002-localtime-nothread.patch} (100%)

diff --git a/package/liblog4c-localtime/liblog4c-localtime-fix-underquoted-path.patch b/package/liblog4c-localtime/liblog4c-0001-localtime-fix-underquoted-path.patch
similarity index 100%
rename from package/liblog4c-localtime/liblog4c-localtime-fix-underquoted-path.patch
rename to package/liblog4c-localtime/liblog4c-0001-localtime-fix-underquoted-path.patch
diff --git a/package/liblog4c-localtime/liblog4c-localtime-nothread.patch b/package/liblog4c-localtime/liblog4c-0002-localtime-nothread.patch
similarity index 100%
rename from package/liblog4c-localtime/liblog4c-localtime-nothread.patch
rename to package/liblog4c-localtime/liblog4c-0002-localtime-nothread.patch
-- 
1.7.10.4
