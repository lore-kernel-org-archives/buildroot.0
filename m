From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 20:00:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] DEVELOPERS: trim Carlos
 Santos' watch list
Message-ID: <20200510174605.43EBB91136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04df6eba78f52de44a927edced244ec4da0742ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- I fixed build problems on cups and cups-filters but don't use them.

- gtest, libpam-radius-auth, libpam-tacplus and perl-file-util were
  used in my previous job. I don't have access to the packages that
  use them neither to the corresponding test infrastructure anymore.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1c3ffaed577b40d4213abf681435e4240ec834c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4fa1c14b52..f2097f11e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -484,18 +484,12 @@ F:	package/sunxi-boards/
 
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
