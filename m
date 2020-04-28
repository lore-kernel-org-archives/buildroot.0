From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 28 Apr 2020 12:16:20 -0300
Subject: [Buildroot] [PATCH] DEVELOPERS: trim Carlos Santos' watch list
Message-ID: <20200428151620.239416-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- I fixed build problems on cups and cups-filters but don't use them.

- gtest, libpam-radius-auth, libpam-tacplus and perl-file-util were
  used in my previous job. I don't have access to the packages that
  use them neither to the corresponding test infrastructure anymore.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 DEVELOPERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd584bb6e4..b36c9f561b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -506,18 +506,12 @@ F:	package/sunxi-boards/
 
 N:	Carlos Santos <unixmania@gmail.com>
 F:	package/busybox/
-F:	package/cups/
-F:	package/cups-filters/
-F:	package/gtest/
 F:	package/initscripts/
 F:	package/intel-microcode/
-F:	package/libpam-radius-auth/
-F:	package/libpam-tacplus/
 F:	package/liburiparser/
 F:	package/modem-manager/
 F:	package/pamtester/
 F:	package/pcm-tools/
-F:	package/perl-file-util/
 F:	package/skeleton-custom/
 F:	package/skeleton-init-common/
 F:	package/skeleton-init-none/
-- 
2.18.2
