From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Nov 2014 10:50:53 +0100
Subject: [Buildroot] [PATCH next 1/1] package/flac: Rename patch
Message-ID: <1417341053-10093-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*.txt are not recognized as patches.
This patch also fixes build with BR2_DEBUG_2=y.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...FLAGS.txt => 0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/flac/{0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt => 0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch} (100%)

diff --git a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
similarity index 100%
rename from package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt
rename to package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
-- 
1.7.10.4
