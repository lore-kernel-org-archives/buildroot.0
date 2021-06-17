From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 17 Jun 2021 13:18:59 +0000
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.22.8
In-Reply-To: <mailman.13.1623672003.114803.buildroot@busybox.net>
References: <mailman.13.1623672003.114803.buildroot@busybox.net>
Message-ID: <7a136148501173cffabf5ddbb2744c75@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on these platforms:
   i386/geode
   i386/intel (build only)
   x86_64/intel (build only)
   aarch64/cortex-a72

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Tested-by: Andreas Ziegler <br015@umbiko.net>
---
  package/mpd/mpd.hash | 2 +-
  package/mpd/mpd.mk   | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 4c3b49823b..1079ccf367 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
  # Locally calculated after checking pgp signature
-sha256 2be149a4895c3cb613477f8cf1193593e3d8a1d38a75ffa7d32da8c8316a4d5e 
mpd-0.22.6.tar.xz
+sha256 9617ed08c9ffafcf5f925819251f6b90df3f4f73cf2838c41033e1962104286d 
mpd-0.22.8.tar.xz
  sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 
COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 06dc7e15d7..8e4576a103 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@

################################################################################

  MPD_VERSION_MAJOR = 0.22
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION = $(MPD_VERSION_MAJOR).8
  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
  MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.32.0
