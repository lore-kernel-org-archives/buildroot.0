From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 16:03:32 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add myself to init-related
 packages
Message-ID: <20180607140257.44B5B87054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41a365d40bf8f391a9af2ac9c7a18bfff97f35f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I'm working on improving the sysvinit scripts, so it's advisable to keep
an eye on them.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c7c798d020..c1ab83ebd3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -408,11 +408,20 @@ N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <casantos@datacom.com.br>
+F:	package/busybox/
 F:	package/gtest/
+F:	package/initscripts/
 F:	package/libpam-radius-auth/
 F:	package/libpam-tacplus/
 F:	package/modem-manager/
 F:	package/perl-file-util/
+F:	package/skeleton-custom/
+F:	package/skeleton-init-common/
+F:	package/skeleton-init-none/
+F:	package/skeleton-init-systemd/
+F:	package/skeleton-init-sysv/
+F:	package/skeleton/
+F:	package/sysvinit/
 F:	package/util-linux/
 F:	package/tpm2-abrmd/
 F:	package/tpm2-tools/
