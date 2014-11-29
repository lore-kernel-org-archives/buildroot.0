From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 22:23:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: rename
	patches to the new convention
Message-ID: <1417296232-29343-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0003 will be extended to fix the blackfin build as well, therefore
it is renamed according to the fixed variable.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...atch => 0001-os-log-adjust-gcc-version-conditions-for-pragma.patch} |    0
 ...r_xorg-server-0002-glyphpadbytes.patch => 0002-glyphpadbytes.patch} |    0
 ...r_xorg-server-0003-microblaze.patch => 0003-image-byte-order.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch => 0001-os-log-adjust-gcc-version-conditions-for-pragma.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0002-glyphpadbytes.patch => 0002-glyphpadbytes.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0003-microblaze.patch => 0003-image-byte-order.patch} (100%)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch b/package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
rename to package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch b/package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch
rename to package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch b/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch
rename to package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
-- 
1.7.10.4
