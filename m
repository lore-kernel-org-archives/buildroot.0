From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:33:02 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add maintainer for pc_x86_64_*
	defconfigs
Message-ID: <20171022142755.0BF8D8073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0823de49ce8c6605866df6d714ee4813ff63a5d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I've been using this packages to test changes in the grub package, so
I can maintain them.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 448dd4b..f0f83b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -535,6 +535,7 @@ F:	package/efivar/
 F:	package/fwts/
 F:	package/spi-tools/
 F:	package/xdotool/
+F:	configs/pc_x86_64_*
 
 N:	Erik Stromdahl <erik.stromdahl@gmail.com>
 F:	package/mxsldr/
