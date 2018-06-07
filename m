From: Carlos Santos <casantos@datacom.com.br>
Date: Wed,  6 Jun 2018 21:15:47 -0300
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to init-related packages
Message-ID: <20180607001547.3721-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working on improving the sysvinit scripts, so it's advisable to keep
an eye on them.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.17.0
