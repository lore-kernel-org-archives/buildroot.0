From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 19:31:06 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: rename
	patches to the new convention
Message-ID: <20141208183125.7E18980159@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f7ff29e4c0298fdf76d4fc1c18187038141483
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0003 will be extended to fix the blackfin build as well, therefore
it is renamed according to the fixed variable.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...adjust-gcc-version-conditions-for-pragma.patch} |    0
 ...lyphpadbytes.patch => 0002-glyphpadbytes.patch} |    0
 ...icroblaze.patch => 0003-image-byte-order.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

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
