From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 13:30:12 +0200
Subject: [Buildroot] [git commit] package/b43-firmware: add missing hash for
	pre 3.2 kernel archive
Message-ID: <20150421113020.F1F10819BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=185280ebfc18895e96be77ab17bf8cb195e9537a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/b43-firmware/b43-firmware.hash |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/b43-firmware/b43-firmware.hash b/package/b43-firmware/b43-firmware.hash
index bafd00c..efc1a6c 100644
--- a/package/b43-firmware/b43-firmware.hash
+++ b/package/b43-firmware/b43-firmware.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 f1e7067aac5b62b67b8b6e4c517990277804339ac16065eb13c731ff909ae46f broadcom-wl-5.100.138.tar.bz2
+sha256 26a8c370f48fc129d0731cfd751c36cae1419b0bc8ca35781126744e60eae009 broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
